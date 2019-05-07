#include "ros/ros.h"

#include <cmath>
#include <math.h>
#include "imu_driver/Angle.h"
#include "sensor_msgs/Imu.h"
#include <cstdlib>
#include <boost/array.hpp>


double std_dev_ang;
double omega;
double std_dev_omega;

double roll;
double pitch;
double yaw;

struct Quaterniond{
    double x;
    double y;
    double z;
    double w;
};

static void toEulerAngle(const Quaterniond& q, double& roll, double& pitch, double& yaw)
{
    // roll (x-axis rotation)
    double sinr_cosp = +2.0 * (q.w * q.x + q.y * q.z);
    double cosr_cosp = +1.0 - 2.0 * (q.x * q.x + q.y * q.y);
    roll = atan2(sinr_cosp, cosr_cosp);

    // pitch (y-axis rotation)
    double sinp = +2.0 * (q.w * q.y - q.z * q.x);
    if (fabs(sinp) >= 1)
        pitch = copysign(M_PI / 2, sinp); // use 90 degrees if out of range
    else
        pitch = asin(sinp);

    // yaw (z-axis rotation)
    double siny_cosp = +2.0 * (q.w * q.z + q.x * q.y);
    double cosy_cosp = +1.0 - 2.0 * (q.y * q.y + q.z * q.z);
    yaw = atan2(siny_cosp, cosy_cosp);
}

void imuCallback(const sensor_msgs::Imu& msg)
{
    omega = msg.angular_velocity.y;
    std_dev_omega = msg.angular_velocity_covariance[4];

    Quaterniond q;
    q.x = msg.orientation.x;
    q.y = msg.orientation.y;
    q.z = msg.orientation.z;
    q.w = msg.orientation.w;
    toEulerAngle(q, roll, pitch, yaw);
    std_dev_ang = 1*M_PI/180; //1 graad standaardafwijking

    ROS_INFO("yaw: %f - std_dev: %f, omaga: %f - std_dev: %f", yaw*180/M_PI, std_dev_ang*180/M_PI, omega, std_dev_omega);
}

bool getAngle(imu_driver::Angle::Request &req, imu_driver::Angle::Response &res)
{
  res.angle = yaw;
  res.std_dev_ang = std_dev_ang;
  res.omega = omega;
  res.std_dev_omega = std_dev_omega;
  return true;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "imu_driver");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("imu", 1000, imuCallback);
  ros::ServiceServer service = n.advertiseService("Angle", getAngle);

  ros::spin();

  return 0;
}
