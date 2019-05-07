cmake_minimum_required(VERSION 2.8.3)
project(reach_rs_driver)

find_package(catkin REQUIRED COMPONENTS
   rospy
   std_msgs
   message_generation
)

catkin_python_setup()
catkin_package(CATKIN_DEPENDS)

install(PROGRAMS
  scripts/reach_rs_driver_node
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
