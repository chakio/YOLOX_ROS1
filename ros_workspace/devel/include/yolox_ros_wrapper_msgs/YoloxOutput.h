// Generated by gencpp from file yolox_ros_wrapper_msgs/YoloxOutput.msg
// DO NOT EDIT!


#ifndef YOLOX_ROS_WRAPPER_MSGS_MESSAGE_YOLOXOUTPUT_H
#define YOLOX_ROS_WRAPPER_MSGS_MESSAGE_YOLOXOUTPUT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <yolox_ros_wrapper_msgs/YoloxDetectedObject.h>

namespace yolox_ros_wrapper_msgs
{
template <class ContainerAllocator>
struct YoloxOutput_
{
  typedef YoloxOutput_<ContainerAllocator> Type;

  YoloxOutput_()
    : detected_objects()  {
    }
  YoloxOutput_(const ContainerAllocator& _alloc)
    : detected_objects(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::yolox_ros_wrapper_msgs::YoloxDetectedObject_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::yolox_ros_wrapper_msgs::YoloxDetectedObject_<ContainerAllocator> >::other >  _detected_objects_type;
  _detected_objects_type detected_objects;





  typedef boost::shared_ptr< ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator> const> ConstPtr;

}; // struct YoloxOutput_

typedef ::yolox_ros_wrapper_msgs::YoloxOutput_<std::allocator<void> > YoloxOutput;

typedef boost::shared_ptr< ::yolox_ros_wrapper_msgs::YoloxOutput > YoloxOutputPtr;
typedef boost::shared_ptr< ::yolox_ros_wrapper_msgs::YoloxOutput const> YoloxOutputConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator1> & lhs, const ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator2> & rhs)
{
  return lhs.detected_objects == rhs.detected_objects;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator1> & lhs, const ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace yolox_ros_wrapper_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b9b9a86cebc49e7b022259f40e43d47d";
  }

  static const char* value(const ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb9b9a86cebc49e7bULL;
  static const uint64_t static_value2 = 0x022259f40e43d47dULL;
};

template<class ContainerAllocator>
struct DataType< ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator> >
{
  static const char* value()
  {
    return "yolox_ros_wrapper_msgs/YoloxOutput";
  }

  static const char* value(const ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator> >
{
  static const char* value()
  {
    return "yolox_ros_wrapper_msgs/YoloxDetectedObject[] detected_objects\n"
"================================================================================\n"
"MSG: yolox_ros_wrapper_msgs/YoloxDetectedObject\n"
"string                                              class_name\n"
"int32                                               class_id\n"
"float32                                             score\n"
"int32                                               x0\n"
"int32                                               x1\n"
"int32                                               y0\n"
"int32                                               y1\n"
"int32                                               image_width\n"
"int32                                               image_height\n"
;
  }

  static const char* value(const ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.detected_objects);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct YoloxOutput_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::yolox_ros_wrapper_msgs::YoloxOutput_<ContainerAllocator>& v)
  {
    s << indent << "detected_objects[]" << std::endl;
    for (size_t i = 0; i < v.detected_objects.size(); ++i)
    {
      s << indent << "  detected_objects[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::yolox_ros_wrapper_msgs::YoloxDetectedObject_<ContainerAllocator> >::stream(s, indent + "    ", v.detected_objects[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // YOLOX_ROS_WRAPPER_MSGS_MESSAGE_YOLOXOUTPUT_H
