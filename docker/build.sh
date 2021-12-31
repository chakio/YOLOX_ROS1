#!/bin/bash

cd `dirname $0`

nvidia-docker &> /dev/null
if [ $? -ne 0 ]; then
    echo "=============================" 
    echo "=nvidia docker not installed="
    echo "============================="

    docker build --tag yolox_ros1:ros  --build-arg base_image=ubuntu:20.04 ./ros/
    docker build --tag yolox_ros1:devel_wo_gpu  --build-arg base_image=yolox_ros1:ros --build-arg USER=${USER} --build-arg USER_ID=`id -u` ./YOLOX/
else
    echo "=========================" 
    echo "=nvidia docker installed="
    echo "========================="

    docker build --tag yolox_ros1:nvidia_docker  --build-arg base_image=nvidia/cuda:11.0-devel-ubuntu20.04 ./nvidia_docker/
    docker build --tag yolox_ros1:ros  --build-arg base_image=yolox_ros1:nvidia_docker  ./ros/
    docker build --tag yolox_ros1:devel_w_gpu  --build-arg base_image=yolox_ros1:ros --build-arg USER=${USER} --build-arg USER_ID=`id -u` ./YOLOX/
fi
