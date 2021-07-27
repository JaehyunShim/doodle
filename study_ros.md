# Study ROS (Robot Operating System)

## 1. Install
- Install ROS
  ```sh
  # -------- ROS1 --------
  # Ubuntu 18.04 with ROS1 Melodic
  $ wget https://raw.githubusercontent.com/JaehyunShim/doodles/master/install_ros_melodic.sh && chmod 755 ./install_ros_melodic.sh && bash ./install_ros_melodic.sh

  # Ubuntu 20.04 with ROS1 Noetic
  $ wget https://raw.githubusercontent.com/JaehyunShim/doodles/master/install_ros_noetic.sh && chmod 755 ./install_ros_noetic.sh && bash ./install_ros_noetic.sh

  # -------- ROS2 --------
  # Ubuntu 18.04 with ROS2 Dashing
  $ wget https://raw.githubusercontent.com/JaehyunShim/doodles/master/install_ros2_dashing.sh && chmod 755 ./install_ros2_dashing.sh && bash ./install_ros2_dashing.sh

  # Ubuntu 20.04 with ROS2 Foxy
  $ wget https://raw.githubusercontent.com/JaehyunShim/doodles/master/install_ros2_foxy.sh && chmod 755 ./install_ros2_foxy.sh && bash ./install_ros2_foxy.sh
  ```

- Setup bashrc
  ```sh
  # Ubuntu 18.04 with ROS1 Melodic and ROS2 Dashing
  https://github.com/JaehyunShim/dotfiles/blob/master/config/bash/bashrc18.04

  # Ubuntu 20.04 with ROS1 Noetic and ROS2 Foxy
  https://github.com/JaehyunShim/dotfiles/blob/master/config/bash/bashrc20.04
  ```

- Setup DDS (for ROS2)
  ```sh
  # If you would like to use CycloneDDS in Ubuntu 20.04 & ROS2 Foxy
  $ sudo apt install ros-foxy-rmw-cyclonedds-cpp
  $ export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
  ```

## 2. Tutorials
- [ros_tutorial](https://github.com/JaehyunShim/ros_tutorial)
- [ros2_tutorial_cpp](https://github.com/JaehyunShim/ros2_tutorial_cpp)
- [ros2_tutorial_py](https://github.com/JaehyunShim/ros2_tutorial_py)

## 3. Command-lines
  ```sh
  # rosdep
  $ rosdep update
  $ rosdep install [package_name]
  $ rosdep install --from-paths src --ignore-src --rosdistro [ros_version] -r -y

  # rosinstall for ROS1 Melodic
  $ cd ~/catkin_ws/src/
  $ rm .rosinstall
  $ wstool init
  $ wstool merge https://raw.githubusercontent.com/JaehyunShim/doodles/master/.ros_tutorials_ros_melodic.rosinstall
  $ wstool update #-j8

  # repos for ROS2 Foxy
  $ cd ~/colcon_ws/src/
  $ wget https://raw.githubusercontent.com/JaehyunShim/doodles/master/.ros_tutorials_ros2_foxy.repos
  $ vcs import < .ros_tutorials_ros2_foxy.repos
  ```

## 4. Workspace Layout
- Metapackage
  - ROS1
    - [CMakeLists.txt](https://github.com/ROBOTIS-GIT/turtlebot3/blob/master/turtlebot3/CMakeLists.txt)
    - [package.xml](https://github.com/ROBOTIS-GIT/turtlebot3/blob/master/turtlebot3/package.xml)
  - ROS2
    - [CMakeLists.txt](https://github.com/ROBOTIS-GIT/turtlebot3/blob/ros2/turtlebot3/CMakeLists.txt)
    - [package.xml](https://github.com/ROBOTIS-GIT/turtlebot3/blob/ros2/turtlebot3/package.xml)
- Packages
  - ROS1
    - [CMakeLists.txt](http://wiki.ros.org/catkin/CMakeLists.txt)
        - [Executable](https://github.com/ROBOTIS-GIT/open_manipulator/blob/master/open_manipulator_controller/CMakeLists.txt)
        - [Libarary](https://github.com/ROBOTIS-GIT/open_manipulator/blob/master/open_manipulator_libs/CMakeLists.txt)
  - ROS2
    - [CMakeLists.txt](https://index.ros.org/doc/ros2/Contributing/Migration-Guide/)
        - [Executable](https://github.com/ROBOTIS-GIT/open_manipulator/blob/ros2/open_manipulator_x_controller/CMakeLists.txt)
        - [Libarary](https://github.com/ROBOTIS-GIT/open_manipulator/blob/ros2/open_manipulator_x_libs/CMakeLists.txt)
- Description Package (RViz)
  - Display topics published by other nodes on RViz using plugins
  - robot_upload.launch, robot_view.launch files
  - [joint_state_publisher](http://wiki.ros.org/joint_state_publisher)
    - Publish joint_states
    - Listen on topics using the source_list param
  - [robot_state_publisher](http://wiki.ros.org/robot_state_publisher)
    - Use the URDF (robot_description) and joint positions (joint_states)
    - Publish the state of the robot to tf
- Gazebo Package (simulator)
  - Spawn world
  - Upload robot urdf
  - Spawn robot
  - Run controller (e.g., joint_state_controller, position_controller, etc.)

## 5. Open Source Packages
- [ROS Control](https://github.com/ros-controls)
  - [ROS Control Dataflow](http://gazebosim.org/tutorials/?tut=ros_control)
  - [ros_control github](https://github.com/ros-controls/ros_control)
  - [ros_controllers github](https://github.com/ros-controls/ros_controllers)
- [ROS Planning](https://github.com/ros-planning)
  - MoveIt!
    - [MoveIt! Concepts](https://moveit.ros.org/documentation/concepts/)
    - [MoveIt! Tutorial](http://docs.ros.org/melodic/api/moveit_tutorials/html/index.html)
- [ROS Perception](https://github.com/ros-perception)
- [ROS Simulation](https://github.com/ros-simulation)
- [ROS Drivers](https://github.com/ros-drivers)
- [ROS Teleop](https://github.com/ros-teleop)
- Rostest and Roslint
  - ROS1: [rostest](http://wiki.ros.org/rostest), [roslint](http://wiki.ros.org/roslint)
  - ROS2: [rostest](https://index.ros.org/doc/ros2/Tutorials/Ament-CMake-Documentation/#testing-and-linting), [roslint](https://github.com/ROBOTIS-GIT/turtlebot3/blob/ros2-devel/.github/workflows/lint.yml)
- [ROS Qt](http://wiki.ros.org/qt_create/Tutorials/Qt%20App%20Templates)
  - [Example](https://github.com/ROBOTIS-GIT/open_manipulator/tree/master/open_manipulator_control_gui)
- [Rocker](https://github.com/osrf/rocker)
  - [study_nvidia](https://github.com/JaehyunShim/doodles/blob/master/study_nvidia.md#2-install-rocker)

## 6. Reference
- [ROS1 Wiki](http://wiki.ros.org/)
- [ROS2 Wiki](https://index.ros.org/)
- [TurtleBot3 github](https://github.com/ROBOTIS-GIT/turtlebot3)
- [OpenManipulator github](https://github.com/ROBOTIS-GIT/open_manipulator)
