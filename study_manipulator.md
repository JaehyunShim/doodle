# Study Manipulator (Crappy)

## 1. Terminology

## 2. MoveIt!
- API List
  - Move Group C++ Interface
  - Motion Planning API
  - Pick and Place
  - MoveIt Setup Assistant
  - URDF and SRDF
  - Low Level Controllers
- Communication
```sh
PhysicalRobot, Gazebo <-> JointTrajectoryActionController <-> MoveGroup <-> Rviz, GUI, etc.
```
- Others
```sh
launch/move_group.launch
launch/moveit_rviz.launch
config/ros_controllers.yaml: controller_list
config/kinematics.yaml: (position_only_ik: True)
```

## 3. Reference
- [OpenManipulator eManual](http://emanual.robotis.com/docs/en/platform/openmanipulator_x/overview/)
- [OpenManipulator github](https://github.com/ROBOTIS-GIT/open_manipulator)
- [MoveIt!](http://docs.ros.org/melodic/api/moveit_tutorials/html/index.html)
- [UR JointTrajectoryActionController](https://github.com/ros-industrial/universal_robot/blob/melodic-devel/ur_driver/src/ur_driver/driver.py)
- [Jaco JointTrajectoryActionController](https://github.com/iki-wgt/jaco-ros/blob/master/kinova_driver/src/jaco_trajectory_action.cpp)
