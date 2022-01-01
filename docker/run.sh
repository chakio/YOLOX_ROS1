#!/bin/bash

cd `dirname $0`
case $(uname) in
    Linux)
        echo "This is an linux environment. Setting up for linux"
        OS=linux
        ;;
    Darwin)
        echo "This is an mac os environment. Setting up for mac"
        OS=mac
        ;;
esac

case ${OS} in
    linux)
        xhost +local:user
        ;;
    mac)
        IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
        #xhost + $IP
        export DISPLAY=$IP:0
        ;;
esac


nvidia-docker &> /dev/null
if [ $? -ne 0 ]; then
    echo "============================="
    echo "=nvidia docker not installed="
    echo "============================="
    docker run \
        -it \
        --privileged \
        --env=DISPLAY=$DISPLAY \
        --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
        --env="QT_X11_NO_MITSHM=1" \
        --rm \
        -v "${PWD}/setting.sh:/startup.sh" \
        -v "${PWD}/../ros_workspace/:/catkin_ws/" \
        -v "${PWD}/config/terminator_config:/home/${USER}/.config/terminator/config" \
        -v /etc/group:/etc/group:ro \
        -v /etc/passwd:/etc/passwd:ro \
        -v /dev:/dev \
        --net host \
        active_track:devel_wo_gpu

else
    echo "========================="
    echo "=nvidia docker installed="
    echo "========================="
    docker run \
        -it \
        --privileged \
        --runtime=nvidia \
        --env=DISPLAY=$DISPLAY \
        --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
        --env="QT_X11_NO_MITSHM=1" \
        --rm \
        -v "${PWD}/setting.sh:/startup.sh" \
        -v "${PWD}/../ros_workspace/:/catkin_ws/" \
        -v "${PWD}/config/terminator_config:/home/${USER}/.config/terminator/config" \
        -v "${PWD}/../../pykeigan_motor/:/pykeigan_motor/" \
        -v /etc/group:/etc/group:ro \
        -v /etc/passwd:/etc/passwd:ro \
        -v /dev:/dev \
        --net host \
        active_track:devel_w_gpu
    fi
