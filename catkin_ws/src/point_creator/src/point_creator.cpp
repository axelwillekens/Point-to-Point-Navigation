#include "ros/ros.h"
#include "point_creator/GetPoint.h"

#include <math.h>
#include <UTM.h>
#include <fstream>
#include <ctime>
#include <vector>


point_creator::GetPoint srv;
ros::ServiceClient point_creatorClient;
// Make sure the coordinates of the track you want to follow are in the current.waypoint file
std::ifstream file ("/home/ubuntu/catkin_ws/src/point_creator/waypointfiles/current.waypoint");

struct XY_co {
	double x;
	double y;
};

std::vector<struct XY_co> xy_co_list;

double d_e;
double x_e;
double y_e;
double x_e_ang;
double y_e_ang;

float d_switch;
int d_e_same;
int d_e_switch;
int arrlength;
double d_e_prev;

bool getpoint(point_creator::GetPoint::Request &req, point_creator::GetPoint::Response &res){

    if (file.is_open()){

    	double lat_r, lon_r;
	double x_r, y_r;

	// When the list does not exist, make sure d_e < d_switch
	if (xy_co_list.size() > 0){
        	d_e = sqrt(pow(xy_co_list[0].x - req.x, 2) + pow(xy_co_list[0].y - req.y, 2));
	} else {
		d_e = 0;
	}

	// Append trajectorypoints to the xy_co_list until it contains the predefined number of elements.
	// When the robot stopped for longer then d_e_switch samples also the next trajectorypoint is choosen.
        if (d_e  < d_switch || d_e_same > d_e_switch){
	
	    if (xy_co_list.size() > 0){
   		xy_co_list.erase(xy_co_list.begin());
	    } 

	    while (xy_co_list.size() < arrlength){
                if(file >> lat_r >> lon_r){
                    int zone = 31; //for Belgium
                    LatLonToUTMXY(lat_r, lon_r, zone, x_r, y_r); 
        	    ROS_INFO("lat_r = %f, lon_r = %f, x_r = %f, y_r = %f", lat_r, lon_r, x_r, y_r);
                } else {
                    file.close();
                    ROS_INFO("stop: end of file");
    
                    return false;
                }
		struct XY_co co = {x_r, y_r};
   		xy_co_list.push_back(co); 
    	    }
        } else {
            d_e_same += 1;
        }

	// Calculate the errors
	double theta = req.theta;
        res.x_e = cos(theta) * (xy_co_list[0].x - req.x) + sin(theta) * (xy_co_list[0].y - req.y);
        res.y_e = -sin(theta) * (xy_co_list[0].x - req.x) + cos(theta) * (xy_co_list[0].y - req.y);

	x_e_ang = xy_co_list[xy_co_list.size() - 1].x - req.x;
	y_e_ang = xy_co_list[xy_co_list.size() - 1].y - req.y;
	double theta_r = - atan2(x_e_ang, y_e_ang);

	double theta_e = theta_r - theta;
	if (theta_e > M_PI) theta_e = theta_e - (2*M_PI);
	if (theta_e < -M_PI) theta_e = theta_e + (2*M_PI);
        res.theta_e = theta_e;

	ROS_INFO("distance is %f, theta_e_ang %f", d_e, RadToDeg(res.theta_e));
	ROS_INFO("X_e_ang %f, Y_e_ang %f", x_e_ang, y_e_ang);
	ROS_INFO("theta %f, theta_r %f", RadToDeg(theta), RadToDeg(theta_r));

	d_e_prev == d_e?d_e_same += 1:d_e_same = 0;
	d_e_prev = d_e;

        return true;

    } else {
        ROS_INFO("unable to open file");

        return false;
    }

}


int main(int argc, char **argv)
{
    d_e_same = 0;
    d_e_prev = 0;
    xy_co_list = std::vector<struct XY_co>();
    ros::init(argc, argv, "odometry_source");
    ros::NodeHandle n;
    ros::NodeHandle nh("~");
    ros::ServiceServer service = n.advertiseService("point", getpoint);

    nh.param("d_switch", d_switch , (float) 0.5);
    nh.param("d_e_switch", d_e_switch, (int) 20);
    nh.param("arrlength", arrlength, (int) 60);

    ros::spin();
    return 0;
}
