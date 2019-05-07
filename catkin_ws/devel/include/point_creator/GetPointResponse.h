// Generated by gencpp from file point_creator/GetPointResponse.msg
// DO NOT EDIT!


#ifndef POINT_CREATOR_MESSAGE_GETPOINTRESPONSE_H
#define POINT_CREATOR_MESSAGE_GETPOINTRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace point_creator
{
template <class ContainerAllocator>
struct GetPointResponse_
{
  typedef GetPointResponse_<ContainerAllocator> Type;

  GetPointResponse_()
    : x_e(0.0)
    , y_e(0.0)
    , theta_e(0.0)  {
    }
  GetPointResponse_(const ContainerAllocator& _alloc)
    : x_e(0.0)
    , y_e(0.0)
    , theta_e(0.0)  {
  (void)_alloc;
    }



   typedef double _x_e_type;
  _x_e_type x_e;

   typedef double _y_e_type;
  _y_e_type y_e;

   typedef double _theta_e_type;
  _theta_e_type theta_e;





  typedef boost::shared_ptr< ::point_creator::GetPointResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::point_creator::GetPointResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GetPointResponse_

typedef ::point_creator::GetPointResponse_<std::allocator<void> > GetPointResponse;

typedef boost::shared_ptr< ::point_creator::GetPointResponse > GetPointResponsePtr;
typedef boost::shared_ptr< ::point_creator::GetPointResponse const> GetPointResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::point_creator::GetPointResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::point_creator::GetPointResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace point_creator

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::point_creator::GetPointResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::point_creator::GetPointResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::point_creator::GetPointResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::point_creator::GetPointResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::point_creator::GetPointResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::point_creator::GetPointResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::point_creator::GetPointResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c342c6a3d9a39d7f7237a3878c0801ce";
  }

  static const char* value(const ::point_creator::GetPointResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc342c6a3d9a39d7fULL;
  static const uint64_t static_value2 = 0x7237a3878c0801ceULL;
};

template<class ContainerAllocator>
struct DataType< ::point_creator::GetPointResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "point_creator/GetPointResponse";
  }

  static const char* value(const ::point_creator::GetPointResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::point_creator::GetPointResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 x_e\n\
float64 y_e\n\
float64 theta_e\n\
\n\
";
  }

  static const char* value(const ::point_creator::GetPointResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::point_creator::GetPointResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x_e);
      stream.next(m.y_e);
      stream.next(m.theta_e);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetPointResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::point_creator::GetPointResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::point_creator::GetPointResponse_<ContainerAllocator>& v)
  {
    s << indent << "x_e: ";
    Printer<double>::stream(s, indent + "  ", v.x_e);
    s << indent << "y_e: ";
    Printer<double>::stream(s, indent + "  ", v.y_e);
    s << indent << "theta_e: ";
    Printer<double>::stream(s, indent + "  ", v.theta_e);
  }
};

} // namespace message_operations
} // namespace ros

#endif // POINT_CREATOR_MESSAGE_GETPOINTRESPONSE_H