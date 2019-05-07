// Generated by gencpp from file imu_driver/Angle.msg
// DO NOT EDIT!


#ifndef IMU_DRIVER_MESSAGE_ANGLE_H
#define IMU_DRIVER_MESSAGE_ANGLE_H

#include <ros/service_traits.h>


#include <imu_driver/AngleRequest.h>
#include <imu_driver/AngleResponse.h>


namespace imu_driver
{

struct Angle
{

typedef AngleRequest Request;
typedef AngleResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct Angle
} // namespace imu_driver


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::imu_driver::Angle > {
  static const char* value()
  {
    return "a46ad9d1acd29c33849f4ca4e749a514";
  }

  static const char* value(const ::imu_driver::Angle&) { return value(); }
};

template<>
struct DataType< ::imu_driver::Angle > {
  static const char* value()
  {
    return "imu_driver/Angle";
  }

  static const char* value(const ::imu_driver::Angle&) { return value(); }
};


// service_traits::MD5Sum< ::imu_driver::AngleRequest> should match 
// service_traits::MD5Sum< ::imu_driver::Angle > 
template<>
struct MD5Sum< ::imu_driver::AngleRequest>
{
  static const char* value()
  {
    return MD5Sum< ::imu_driver::Angle >::value();
  }
  static const char* value(const ::imu_driver::AngleRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::imu_driver::AngleRequest> should match 
// service_traits::DataType< ::imu_driver::Angle > 
template<>
struct DataType< ::imu_driver::AngleRequest>
{
  static const char* value()
  {
    return DataType< ::imu_driver::Angle >::value();
  }
  static const char* value(const ::imu_driver::AngleRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::imu_driver::AngleResponse> should match 
// service_traits::MD5Sum< ::imu_driver::Angle > 
template<>
struct MD5Sum< ::imu_driver::AngleResponse>
{
  static const char* value()
  {
    return MD5Sum< ::imu_driver::Angle >::value();
  }
  static const char* value(const ::imu_driver::AngleResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::imu_driver::AngleResponse> should match 
// service_traits::DataType< ::imu_driver::Angle > 
template<>
struct DataType< ::imu_driver::AngleResponse>
{
  static const char* value()
  {
    return DataType< ::imu_driver::Angle >::value();
  }
  static const char* value(const ::imu_driver::AngleResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // IMU_DRIVER_MESSAGE_ANGLE_H