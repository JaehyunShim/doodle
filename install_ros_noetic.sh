#!/bin/bash
# Apache License 2.0
# Copyright (c) 2020, ROBOTIS CO., LTD.

echo ""
echo "[Note] Target OS version  >>> Ubuntu 20.04.x (Focal Fossa) or Linux Mint 21.x"
echo "[Note] Target ROS version >>> ROS Noetic Ninjemys"
echo "[Note] Catkin workspace   >>> $HOME/catkin_ws"
echo ""
echo "PRESS [ENTER] TO CONTINUE THE INSTALLATION"
echo "IF YOU WANT TO CANCEL, PRESS [CTRL] + [C]"
read

echo "[Set the target OS, ROS version and name of catkin workspace]"
name_os_version=${name_os_version:="focal"}
name_ros_version=${name_ros_version:="noetic"}
name_catkin_workspace=${name_catkin_workspace:="catkin_ws"}

echo "[Update the package lists and upgrade them]"
sudo apt update -y
sudo apt upgrade -y

echo "[Install build environment, the chrony, ntpdate and set the ntpdate]"
sudo apt install -y chrony ntpdate build-essential
sudo ntpdate ntp.ubuntu.com

echo "[Add the ROS repository]"
if [ ! -e /etc/apt/sources.list.d/ros-latest.list ]; then
  sudo sh -c "echo \"deb http://packages.ros.org/ros/ubuntu ${name_os_version} main\" > /etc/apt/sources.list.d/ros-latest.list"
fi

echo "[Download the ROS keys]"
roskey=`apt-key list | grep "Open Robotics"`
if [ -z "$roskey" ]; then
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
fi

echo "[Check the ROS keys]"
roskey=`apt-key list | grep "Open Robotics"`
if [ -n "$roskey" ]; then
  echo "[ROS key exists in the list]"
else
  echo "[Failed to receive the ROS key, aborts the installation]"
  exit 0
fi

echo "[Update the package lists and upgrade them]"
sudo apt update -y
sudo apt upgrade -y

echo "[Install the ros-desktop-full and all rqt plugins]"
sudo apt install -y ros-$name_ros_version-desktop-full
sudo apt-get install -y ros-$name_ros_version-rqt-*

echo "[Initialize rosdep]"
sudo sh -c "rosdep init"
rosdep update

echo "[Environment setup and getting rosinstall]"
source /opt/ros/$name_ros_version/setup.sh
sudo apt install -y python3-rosinstall python3-rosinstall-generator python3-wstool git

echo "[Make the catkin workspace and test the catkin_make]"
mkdir -p $HOME/$name_catkin_workspace/src
cd $HOME/$name_catkin_workspace/src
catkin_init_workspace
cd $HOME/$name_catkin_workspace
catkin_make

echo "[Set the ROS evironment]"
sh -c "echo \"alias gb='gedit ~/.bashrc'\" >> ~/.bashrc"
sh -c "echo \"alias nb='nano ~/.bashrc'\" >> ~/.bashrc"
sh -c "echo \"alias sb='source ~/.bashrc'\" >> ~/.bashrc"
sh -c "echo \"alias gs='git status'\" >> ~/.bashrc"
sh -c "echo \"alias gp='find . -maxdepth 3 -name .git -type d | rev | cut -c 6- | rev | xargs -I {} git -C {} pull'\" >> ~/.bashrc"
sh -c "echo \"alias nt='nautilus .'\" >> ~/.bashrc"

sh -c "echo \"alias cw='cd ~/$name_catkin_workspace'\" >> ~/.bashrc"
sh -c "echo \"alias cs='cd ~/$name_catkin_workspace/src'\" >> ~/.bashrc"
sh -c "echo \"alias cm='cd ~/$name_catkin_workspace && catkin_make && rospack profile && source ~/$name_catkin_workspace/devel/setup.bash'\" >> ~/.bashrc"
sh -c "echo \"alias cb='cd ~/$name_catkin_workspace && catkin build && rospack profile && source ~/$name_catkin_workspace/devel/setup.bash'\" >> ~/.bashrc"
sh -c "echo \"alias ct='cd ~/$name_catkin_workspace && catkin_make run_tests roslint && rospack profile && source ~/$name_catkin_workspace/devel/setup.bash'\" >> ~/.bashrc"
sh -c "echo \"alias ci='cd ~/$name_catkin_workspace && rosdep install --from-paths src --ignore-src --rosdistro $name_ros_version -r -y'\" >> ~/.bashrc"
sh -c "echo \"alias cr='cd ~/$name_catkin_workspace && rm -rf build devel logs'\" >> ~/.bashrc"

sh -c "echo \"alias pe='env | grep ROS'\" >> ~/.bashrc"

sh -c "echo \"alias ka='killall -9'\" >> ~/.bashrc"
sh -c "echo \"alias kg='killall -9 gazebo & killall -9 gzserver  & killall -9 gzclient'\" >> ~/.bashrc"

sh -c "echo \"alias rosreinstall='sudo apt remove ros-$name_ros_version-* -y && sudo apt autoremove -y && sudo apt install ros-$name_ros_version-desktop-full -y'\" >> ~/.bashrc"

sh -c "echo \"source /opt/ros/$name_ros_version/setup.bash\" >> ~/.bashrc"
sh -c "echo \"source ~/$name_catkin_workspace/devel/setup.bash\" >> ~/.bashrc"

sh -c "echo \"export ROS_MASTER_URI=http://localhost:11311\" >> ~/.bashrc"
sh -c "echo \"export ROS_HOSTNAME=localhost\" >> ~/.bashrc"
sh -c "echo \"export TURTLEBOT3_MODEL=burger\" >> ~/.bashrc"
sh -c "echo \"alias tb3='ssh -XC ubuntu@0.0.0.0' \" >> ~/.bashrc"

exec bash

echo "[Complete!!!]"
exit 0
