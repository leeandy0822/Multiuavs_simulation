// Generated by gencpp from file mav_msgs/System_pose.msg
// DO NOT EDIT!


#ifndef MAV_MSGS_MESSAGE_SYSTEM_POSE_H
#define MAV_MSGS_MESSAGE_SYSTEM_POSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Vector3.h>

namespace mav_msgs
{
template <class ContainerAllocator>
struct System_pose_
{
  typedef System_pose_<ContainerAllocator> Type;

  System_pose_()
    : header()
    , uav1()
    , uav1_acc()
    , uav2()
    , uav2_acc()
    , uav3()
    , uav3_acc()
    , uav4()
    , uav4_acc()
    , payload()
    , payload_W()
    , payload_acc()
    , payload_vel()  {
    }
  System_pose_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , uav1(_alloc)
    , uav1_acc(_alloc)
    , uav2(_alloc)
    , uav2_acc(_alloc)
    , uav3(_alloc)
    , uav3_acc(_alloc)
    , uav4(_alloc)
    , uav4_acc(_alloc)
    , payload(_alloc)
    , payload_W(_alloc)
    , payload_acc(_alloc)
    , payload_vel(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef  ::geometry_msgs::Pose_<ContainerAllocator>  _uav1_type;
  _uav1_type uav1;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _uav1_acc_type;
  _uav1_acc_type uav1_acc;

   typedef  ::geometry_msgs::Pose_<ContainerAllocator>  _uav2_type;
  _uav2_type uav2;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _uav2_acc_type;
  _uav2_acc_type uav2_acc;

   typedef  ::geometry_msgs::Pose_<ContainerAllocator>  _uav3_type;
  _uav3_type uav3;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _uav3_acc_type;
  _uav3_acc_type uav3_acc;

   typedef  ::geometry_msgs::Pose_<ContainerAllocator>  _uav4_type;
  _uav4_type uav4;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _uav4_acc_type;
  _uav4_acc_type uav4_acc;

   typedef  ::geometry_msgs::Pose_<ContainerAllocator>  _payload_type;
  _payload_type payload;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _payload_W_type;
  _payload_W_type payload_W;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _payload_acc_type;
  _payload_acc_type payload_acc;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _payload_vel_type;
  _payload_vel_type payload_vel;





  typedef boost::shared_ptr< ::mav_msgs::System_pose_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mav_msgs::System_pose_<ContainerAllocator> const> ConstPtr;

}; // struct System_pose_

typedef ::mav_msgs::System_pose_<std::allocator<void> > System_pose;

typedef boost::shared_ptr< ::mav_msgs::System_pose > System_posePtr;
typedef boost::shared_ptr< ::mav_msgs::System_pose const> System_poseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mav_msgs::System_pose_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mav_msgs::System_pose_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace mav_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'geometry_msgs': ['/home/leeandy/MATLAB_2021b/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/home/leeandy/MATLAB_2021b/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg', '/home/leeandy/MATLAB_2021b/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg'], 'mav_msgs': ['/home/leeandy/Desktop/ICL_controller/Gazebo_simulation/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::mav_msgs::System_pose_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mav_msgs::System_pose_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mav_msgs::System_pose_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mav_msgs::System_pose_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mav_msgs::System_pose_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mav_msgs::System_pose_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mav_msgs::System_pose_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ebb248f942d8dda28943911c5ba3abb3";
  }

  static const char* value(const ::mav_msgs::System_pose_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xebb248f942d8dda2ULL;
  static const uint64_t static_value2 = 0x8943911c5ba3abb3ULL;
};

template<class ContainerAllocator>
struct DataType< ::mav_msgs::System_pose_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mav_msgs/System_pose";
  }

  static const char* value(const ::mav_msgs::System_pose_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mav_msgs::System_pose_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"\n"
"geometry_msgs/Pose uav1\n"
"geometry_msgs/Vector3 uav1_acc\n"
"geometry_msgs/Pose uav2\n"
"geometry_msgs/Vector3 uav2_acc\n"
"geometry_msgs/Pose uav3\n"
"geometry_msgs/Vector3 uav3_acc\n"
"geometry_msgs/Pose uav4\n"
"geometry_msgs/Vector3 uav4_acc\n"
"geometry_msgs/Pose payload\n"
"geometry_msgs/Vector3 payload_W\n"
"geometry_msgs/Vector3 payload_acc\n"
"geometry_msgs/Vector3 payload_vel\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Pose\n"
"# A representation of pose in free space, composed of position and orientation. \n"
"Point position\n"
"Quaternion orientation\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::mav_msgs::System_pose_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mav_msgs::System_pose_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.uav1);
      stream.next(m.uav1_acc);
      stream.next(m.uav2);
      stream.next(m.uav2_acc);
      stream.next(m.uav3);
      stream.next(m.uav3_acc);
      stream.next(m.uav4);
      stream.next(m.uav4_acc);
      stream.next(m.payload);
      stream.next(m.payload_W);
      stream.next(m.payload_acc);
      stream.next(m.payload_vel);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct System_pose_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mav_msgs::System_pose_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mav_msgs::System_pose_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "uav1: ";
    s << std::endl;
    Printer< ::geometry_msgs::Pose_<ContainerAllocator> >::stream(s, indent + "  ", v.uav1);
    s << indent << "uav1_acc: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.uav1_acc);
    s << indent << "uav2: ";
    s << std::endl;
    Printer< ::geometry_msgs::Pose_<ContainerAllocator> >::stream(s, indent + "  ", v.uav2);
    s << indent << "uav2_acc: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.uav2_acc);
    s << indent << "uav3: ";
    s << std::endl;
    Printer< ::geometry_msgs::Pose_<ContainerAllocator> >::stream(s, indent + "  ", v.uav3);
    s << indent << "uav3_acc: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.uav3_acc);
    s << indent << "uav4: ";
    s << std::endl;
    Printer< ::geometry_msgs::Pose_<ContainerAllocator> >::stream(s, indent + "  ", v.uav4);
    s << indent << "uav4_acc: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.uav4_acc);
    s << indent << "payload: ";
    s << std::endl;
    Printer< ::geometry_msgs::Pose_<ContainerAllocator> >::stream(s, indent + "  ", v.payload);
    s << indent << "payload_W: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.payload_W);
    s << indent << "payload_acc: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.payload_acc);
    s << indent << "payload_vel: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.payload_vel);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MAV_MSGS_MESSAGE_SYSTEM_POSE_H