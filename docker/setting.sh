## source 
source /catkin_ws/devel/setup.bash

network_if=eno1
CATKIN_HOME=/catkin_ws

## export
#export ros_master=global
export ros_master=local
#export ros_master_global=192.168.1.55
export hsr_ip=192.168.1.47
export dlbox_ip=192.168.1.54

export ROS_HOME=~/.ros

echo "network_if : "$network_if
export TARGET_IP=$(LANG=C /sbin/ifconfig $network_if | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*')
export ROS_IP=$TARGET_IP

export ROS_MASTER_URI=http://$TARGET_IP:11311

## alias
cdls()
{
    \cd "$@" && ls
}
alias cd="cdls"
alias cm="cd ${CATKIN_HOME} && catkin_make && cd -"

## echo
echo "ROS_IP:"$ROS_IP
echo "ROS_MASTER_URI:"$ROS_MASTER_URI
echo "==========================="
echo "=LOADED GLOBAL ROS SETTING="
echo "==========================="