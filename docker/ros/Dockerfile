ARG base_image
FROM ${base_image}
ARG base_image
#FROM $base_image
RUN echo base image: ${base_image}

#######################################################################
###                         Initial setting                         ###
#######################################################################

#######################################################################
##                            Speeding up                            ##
#######################################################################
RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list

#######################################################################
##                            install ros                            ##
#######################################################################
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update 

# install packages
RUN apt-get install -q -y \
    dirmngr \
    gnupg2 \
    lsb-release \
    curl \
    && rm -rf /var/lib/apt/lists/*
# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list
# setup keys
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN apt-get update 
RUN apt install -y \
 ros-noetic-desktop-full

# install ros packages
ENV ROS_DISTRO noetic

# setup entrypoint
COPY ./ros_entrypoint.sh /

RUN apt install -y \
    python3-rosdep \
    python3-rosinstall \ 
    python3-rosinstall-generator \ 
    python3-wstool \
    build-essential 

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]