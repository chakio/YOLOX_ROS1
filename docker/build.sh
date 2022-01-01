#!/bin/bash

cd `dirname $0`

nvidia-docker &> /dev/null
if [ $? -ne 0 ]; then
    echo "=============================" 
    echo "=nvidia docker not installed="
    echo "============================="

    docker build --tag active_track:ros  --build-arg base_image=ubuntu:20.04 ./ros/
    docker build --tag active_track:devel_wo_gpu  --build-arg base_image=active_track:ros --build-arg USER=${USER} --build-arg USER_ID=`id -u` ./active_track/
else
    echo "=========================" 
    echo "=nvidia docker installed="
    echo "========================="

    docker build --tag active_track:nvidia_docker  --build-arg base_image=nvidia/cuda:11.0-devel-ubuntu20.04 ./nvidia_docker/
    docker build --tag active_track:ros  --build-arg base_image=active_track:nvidia_docker  ./ros/
    docker build --tag active_track:devel_w_gpu  --build-arg base_image=active_track:ros --build-arg USER=${USER} --build-arg USER_ID=`id -u` ./active_track/
fi
