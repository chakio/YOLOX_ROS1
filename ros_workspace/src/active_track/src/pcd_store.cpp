
#include <ros/ros.h>
#include <std_msgs/String.h>
#include <pcl_ros/io/pcd_io.h>

#include <sensor_msgs/image_encodings.h>
#include <sensor_msgs/LaserScan.h>
#include <geometry_msgs/WrenchStamped.h>
#include <sensor_msgs/Imu.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/point_cloud_conversion.h>
#include <sensor_msgs/JointState.h>

#include <stdio.h>
#include <termios.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/time.h>
#include <time.h>
#include <pcl/visualization/cloud_viewer.h>
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <pcl/io/io.h>
#include <pcl/io/pcd_io.h>

#include <boost/thread/thread.hpp>
#include <pcl/common/common_headers.h>
#include <pcl/features/normal_3d.h>
#include <pcl/point_types.h>

#include <tf/transform_listener.h>
#include <tf/transform_datatypes.h>


class PcdStore
{
private:
  ros::NodeHandle _nh;
  ros::Subscriber _sub_pcd;
  ros::Subscriber _sub_command;
  ros::Publisher _pub_pcd;
  ros::ServiceServer service;
  pcl::PointCloud<pcl::PointXYZRGB>
      input_cloud0, input_cloud1;

  sensor_msgs::PointCloud2 total_pcd;  
  std::vector<sensor_msgs::PointCloud2> pcds;  
 
  tf::TransformListener _tflistener;
  std::string _target_frame = "keigan_motor/base";
  
  std::string mode = "";

  //struct timeval start, end;
  //int now;
  double start, end;
  int now;
  // pcl::visualization::CloudViewer viewer("aaa");
public:
  PcdStore()
  {
      _sub_pcd   = _nh.subscribe("/points2", 1, &PcdStore::PCD_cb, this);
      _pub_pcd = _nh.advertise<sensor_msgs::PointCloud2>("/points2_transformed", 1);
      _sub_command   = _nh.subscribe("/command", 1, &PcdStore::command_cb, this);
  }
  ~PcdStore() {}

  // get points
  void command_cb(const std_msgs::String::ConstPtr& msg)
  {
    if (msg->data == "start" )
    {
        mode = "start";
    }
    else
    {
        mode = "end";
    }
    std::cout<<"command_cb: "<<msg->data<<std::endl;    
    std::cout<<mode<<std::endl;    
  }
  void PCD_cb(const sensor_msgs::PointCloud2ConstPtr &cloud)
  {
      // std::cout << "cb"<<std::endl;
    if ((cloud->width * cloud->height) == 0)
      return;
    transform_pointcloud(*cloud);
    
  }
  void transform_pointcloud(const sensor_msgs::PointCloud2& cloud)
  {
    sensor_msgs::PointCloud pointcloud1_in;
	sensor_msgs::PointCloud pointcloud1_transed;
    sensor_msgs::PointCloud2 pointcloud2_transed;
    
    

    sensor_msgs::convertPointCloud2ToPointCloud(cloud, pointcloud1_in);
	try{
		_tflistener.waitForTransform(_target_frame, cloud.header.frame_id, cloud.header.stamp, ros::Duration(0.1));
		_tflistener.transformPointCloud(_target_frame,cloud.header.stamp, pointcloud1_in, cloud.header.frame_id, pointcloud1_transed);
		sensor_msgs::convertPointCloudToPointCloud2(pointcloud1_transed, pointcloud2_transed);
        


        if (mode == "start")
        {
            _pub_pcd.publish(pointcloud2_transed);
            pcds.push_back(pointcloud2_transed);
        }
        else if(mode == "end")
        {
            for(int index=0; index < pcds.size();index++)
            {
                if(index%5==0)
                {
                    sensor_msgs::PointCloud2 total_pcd_before = total_pcd;  
                    pcl::concatenatePointCloud (total_pcd_before, pcds[index], total_pcd);
                    std::cout<<index<<"/"<<pcds.size()<<std::endl;  
                }
            }
            pcds.clear();

            std::cout<<mode<<std::endl;
            _pub_pcd.publish(total_pcd);
            mode = "!!";
            std::cout<<"publish"<<std::endl;    
        }
        else if(mode == "")
        {
            _pub_pcd.publish(pointcloud2_transed);
        }
        


        // std::cout << "convert"<<std::endl;
	}
	catch(tf::TransformException ex){
		ROS_ERROR("%s",ex.what());
	}
  }
  
};

int main(int argc, char **argv)
{
  ros::init(argc, argv, "pcd_store");
 
  PcdStore pcd_store;
  
  ros::spin();
}