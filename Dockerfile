#--------------------------------------------------
## Docker Image
#--------------------------------------------------
# ROS Melodic with Ubuntu 16.04
FROM jshim/ros:melodic-ros-base-xenial

#--------------------------------------------------
## Maintainer
#--------------------------------------------------
MAINTAINER sjh2808@gmail.com

#--------------------------------------------------
## Install ROS Tutorial packages
#--------------------------------------------------
RUN apt-get -y -qq update && \
    apt-get -y -qq upgrade

RUN cd ~/catkin_ws/src && \
    git clone -b melodic-devel https://github.com/ros/ros_tutorials.git

RUN /bin/bash -c '. /opt/ros/melodic/setup.bash; cd /home/ubuntu/catkin_ws; catkin_make'
