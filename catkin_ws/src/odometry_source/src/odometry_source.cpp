#include "ros/ros.h"
#include "std_msgs/Float64MultiArray.h"
#include "geometry_msgs/TwistStamped.h"
#include "geometry_msgs/Twist.h"
#include "sensor_msgs/NavSatFix.h"
#include "imu_driver/Angle.h"
#include "point_creator/GetPoint.h"

#include <Eigen/Dense>
#include <math.h>
#include <UTM.h>
#include <unistd.h>

using Eigen::MatrixXf;
using namespace Eigen;

MatrixXf x(4,1);    // staat: [x, velx, y, vely, theta, omeaga]^T
MatrixXf F(4,4);
MatrixXf B(4,2);
MatrixXf Q(4,4);
MatrixXf H(4,4);
MatrixXf P(4,4);
MatrixXf K(4,4);

MatrixXf Rk(4,4);   // covariantiematrix
MatrixXf uk(2,1);   // actie
MatrixXf zk(4,1);   // observatie (bevat steeds waarden van vorige schattingen tenzij overschreven door een nieuwe meting

MatrixXf I(4,4);

imu_driver::Angle anglesrv;
point_creator::GetPoint pointsrv;
ros::ServiceClient angleClient;
ros::ServiceClient pointClient;
ros::Publisher cmd_vel_pub;
geometry_msgs::Twist cmd_vel_msg;

int status;
double ts;	//time in seconds
double theta;
double k1;
double k2;
double k3;
double vr;
bool initx_fix;
bool initx_vel;

void clearkalman(){
    I << 1, 0, 0, 0,
         0, 1, 0, 0,
         0, 0, 1, 0,
         0, 0, 0, 1;
    Q = I;
    H = I;
    P = I;
    F << 1, ts, 0, 0,
         0, 1,  0, 0,
         0, 0,  1, ts,
         0, 0,  0, 1;

    x = MatrixXf::Zero(4,1);
    Rk = MatrixXf::Zero(4,4);
    uk = MatrixXf::Zero(2,1);
    zk = MatrixXf::Zero(4,1);

    status = -1; //only fix if status >= 0
    ts = 0.005; //ts in seconds => 5ms
    initx_fix = false;
    initx_vel = false;
}

void kalman(){
    theta = anglesrv.response.angle;

    B << cos(theta)*ts, 0,
	cos(theta), 	0,
	sin(theta)*ts, 	0,
	sin(theta),	0;
    
    // predict
    x = F*x+B*uk;
    P = F*P*F.transpose()+Q;
    // update
    MatrixXf N = Rk + H*P*H.transpose();
    K = P*H.transpose()*N.inverse();
    x = x + K*(zk - H*x);
    P = P - K*H*P;
}

void calccmd_vel(double x_e, double y_e, double theta_e){
    double omega = anglesrv.response.omega;

    //required speed and omega (change when in a corner!)
    double a_r = 0;
    double v_r = vr;
    double omega_r = k3 * theta_e;

    uk << y_e*omega + v_r*cos(theta_e) + k1*std::min(1.0, std::max(-1.0,(double) x_e)),
	  omega_r + y_e*a_r/(1+pow(v_r*y_e,2)) + pow(v_r,2)*sin(theta_e)/(1+pow(v_r*y_e,2)) + k2*std::min(1.0, std::max(-1.0,theta_e + atan(v_r*y_e)));
    cmd_vel_msg.linear.x = uk(0);
    cmd_vel_msg.angular.z = uk(1);
                            
}

void fixCallback(const sensor_msgs::NavSatFix& msg)
{
    double pos_x;
    double pos_y;
    double lat = msg.latitude;
    double lon = msg.longitude;
    boost::array<double, 9ul> cov = msg.position_covariance;

    int zone = 31; //voor België
    LatLonToUTMXY(lat, lon, zone, pos_x, pos_y);

    zk(0) = pos_x;
    zk(2) = pos_y;
    Rk(0,0) = cov[0];
    Rk(2,2) = cov[4];
    ROS_INFO("(x_meas = %f, y_meas = %f, lat = %f, lon = %f)", zk(0), zk(2), lat, lon);

    status = msg.status.status;
    initx_fix = true;
}

void velCallback(const geometry_msgs::TwistStamped& msg)
{
    double velx = std::isnan((double) msg.twist.linear.x)?0:msg.twist.linear.x;
    double vely = std::isnan((double) msg.twist.linear.y)?0:msg.twist.linear.y;

    zk(1,0) = velx;
    zk(3,0) = vely;
    Rk(1,1) = 0.05;
    Rk(3,3) = 0.05;

    initx_vel = true;
}


int main(int argc, char **argv)
{
    ros::init(argc, argv, "odometry_source");
    ros::NodeHandle n;
    ros::NodeHandle nh("~");

    nh.param("k1", k1, (double) 0.2);
    nh.param("k2", k2, (double) 0.13);
    nh.param("k3", k3, (double) 0);
    nh.param("vr", vr, (double) 0.4);

    cmd_vel_pub = n.advertise<geometry_msgs::Twist>("cmd_vel", 1000);
    angleClient = n.serviceClient<imu_driver::Angle>("Angle");
    pointClient = n.serviceClient<point_creator::GetPoint>("point");
    ros::Subscriber gnss_sub = n.subscribe("fix", 1000, fixCallback);
    ros::Subscriber vel_sub = n.subscribe("vel", 1000, velCallback);
    clearkalman();

    while (ros::ok()){
	// wait until F and R are initialized by first measured values.
	if (initx_fix && initx_vel){
            kalman();
	    ROS_INFO("(x_kal = %f, y_kal = %f)", x(0,0), x(2,0));

    	    // *******************************************************************************
	    //when the gps is fixed
	    if (status >= 0){
	        //calculate cmd_vel_pub
	        pointsrv.request.x = x(0);
	        pointsrv.request.y = x(2);
	        pointsrv.request.theta = theta;
		
	        if (pointClient.call(pointsrv) && angleClient.call(anglesrv)){
	            calccmd_vel(pointsrv.response.x_e, pointsrv.response.y_e, pointsrv.response.theta_e);
	        } else {
	            // stop robot
	            cmd_vel_msg.linear.x = 0;
	            cmd_vel_msg.angular.z = 0;
	        }
	    } else {
	        //when no fix --> stop robot
	        cmd_vel_msg.linear.x = 0;
	        cmd_vel_msg.angular.z = 0;
	        clearkalman();
	    }
	    cmd_vel_pub.publish(cmd_vel_msg);

       	    //copy state to observation
            //obsarvation matrix will be overwritten by callbacks when new data arrives.
            zk = x;
            usleep(ts*1000000); //sleep for ts seconds 
	}
        ros::spinOnce();
    }

    return 0;
}
