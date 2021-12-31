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
##                      install common packages                      ##
#######################################################################
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update 

RUN apt-get install -y --no-install-recommends \
   pkg-config \
   apt-utils \
   wget \
   git \
   python-setuptools \
   build-essential \ 
   net-tools \
   gedit \
   terminator \
   nautilus \
   software-properties-common \
   apt-transport-https \
   libopencv-dev \
   ffmpeg \
   x264 \
   libx264-dev \
   zip \
   unzip \
   usbutils \
   dbus-x11 \
   libusb-1.0-0-dev

#######################################################################
##                           install font                            ##
#######################################################################
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections 
RUN apt-get update 
RUN apt-get install -y ttf-mscorefonts-installer \
   ttf-ubuntu-font-family \
   msttcorefonts -qq

#######################################################################
##                     install python packages                       ##
#######################################################################
RUN apt-get install -y \
    python3-tk 
RUN apt-get update && apt-get install -y python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install typing
RUN pip3 install pylint
RUN pip3 install autopep8
#######################################################################
##                           install YOLOX                           ##
#######################################################################
ENV DEBIAN_FRONTEND=noninteractive
RUN git clone https://github.com/Megvii-BaseDetection/YOLOX.git
WORKDIR /YOLOX
RUN pip3 install -U pip && pip3 install -r requirements.txt
RUN pip3 install -v -e .
RUN pip3 install cython; pip3 install 'git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI'
RUN wget https://github.com/Megvii-BaseDetection/YOLOX/releases/download/0.1.1rc0/yolox_s.pth -O ./yolox_s.pth
WORKDIR /

RUN chmod 777 -R /YOLOX
#######################################################################
##                           cleaning up                             ##
#######################################################################
RUN rm -rf /var/lib/apt/lists/*

#######################################################################
##                         make sudoer user                          ##
#######################################################################
ARG USER
ARG USER_ID
RUN groupadd -g 1000 developer && \
    useradd  -g      developer -G sudo -m -u $USER_ID -s /bin/bash ${USER} && \
    echo "${USER}:${USER}" | chpasswd
RUN echo "Defaults visiblepw" >> /etc/sudoers
RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
#######################################################################
##                    make user accessible to usb                    ##
#######################################################################
RUN adduser ${USER} dialout


USER $USER
WORKDIR /catkin_ws

RUN echo "export PS1='\[\e[1;31;40m\]YOLOX\[\e[0m\] \u:\w\$ '">> ~/.bashrc
RUN echo "source /startup.sh">> ~/.bashrc

