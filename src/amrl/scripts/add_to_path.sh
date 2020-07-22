#!/bin/bash
cd ../
echo "export ROS_PACKAGE_PATH=`pwd`:`pwd`/amrl_msgs:`pwd`/amrl_maps:\$ROS_PACKAGE_PATH" >> ~/.bashrc
source ~/.bashrc
