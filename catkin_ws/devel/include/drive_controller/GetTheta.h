// Generated by gencpp from file drive_controller/GetTheta.msg
// DO NOT EDIT!


#ifndef DRIVE_CONTROLLER_MESSAGE_GETTHETA_H
#define DRIVE_CONTROLLER_MESSAGE_GETTHETA_H

#include <ros/service_traits.h>


#include <drive_controller/GetThetaRequest.h>
#include <drive_controller/GetThetaResponse.h>


namespace drive_controller
{

struct GetTheta
{

typedef GetThetaRequest Request;
typedef GetThetaResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct GetTheta
} // namespace drive_controller


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::drive_controller::GetTheta > {
  static const char* value()
  {
    return "4657e14e2a2d8f2699f1878ab10ffbed";
  }

  static const char* value(const ::drive_controller::GetTheta&) { return value(); }
};

template<>
struct DataType< ::drive_controller::GetTheta > {
  static const char* value()
  {
    return "drive_controller/GetTheta";
  }

  static const char* value(const ::drive_controller::GetTheta&) { return value(); }
};


// service_traits::MD5Sum< ::drive_controller::GetThetaRequest> should match 
// service_traits::MD5Sum< ::drive_controller::GetTheta > 
template<>
struct MD5Sum< ::drive_controller::GetThetaRequest>
{
  static const char* value()
  {
    return MD5Sum< ::drive_controller::GetTheta >::value();
  }
  static const char* value(const ::drive_controller::GetThetaRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::drive_controller::GetThetaRequest> should match 
// service_traits::DataType< ::drive_controller::GetTheta > 
template<>
struct DataType< ::drive_controller::GetThetaRequest>
{
  static const char* value()
  {
    return DataType< ::drive_controller::GetTheta >::value();
  }
  static const char* value(const ::drive_controller::GetThetaRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::drive_controller::GetThetaResponse> should match 
// service_traits::MD5Sum< ::drive_controller::GetTheta > 
template<>
struct MD5Sum< ::drive_controller::GetThetaResponse>
{
  static const char* value()
  {
    return MD5Sum< ::drive_controller::GetTheta >::value();
  }
  static const char* value(const ::drive_controller::GetThetaResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::drive_controller::GetThetaResponse> should match 
// service_traits::DataType< ::drive_controller::GetTheta > 
template<>
struct DataType< ::drive_controller::GetThetaResponse>
{
  static const char* value()
  {
    return DataType< ::drive_controller::GetTheta >::value();
  }
  static const char* value(const ::drive_controller::GetThetaResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // DRIVE_CONTROLLER_MESSAGE_GETTHETA_H
