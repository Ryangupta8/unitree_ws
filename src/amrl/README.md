# spot_simulation

This meta package hosts all the packages needed to simulate the spot platform using `graph_navigation` for navigation and `enml` for localization.

## Installation

Clone this repository in the `src` directory of a catkin workspace, and required simulation environment

    $ git clone https://github.com/utsmads/spot_simulation.git
    $ git clone https://github.com/utexas-bwi/ahg_common.git

Update the submodules

    $ cd spot_simulation
    $ git submodule sync --recursive
    $ git submodule update --init --recursive

Add all the ros-build packages to your path:

    $ cd scripts
    $ ./add_to_path.sh
    
Build dependent msgs package:

    $ cd ../amrl_msgs && export ROS_PACKAGE_PATH=`pwd`:$ROS_PACKAGE_PATH && make

Build the navigation and localization modules

    $ cd ../ && make

if there are no errors, you should now build the catkin packages of `spot_simulation` by going to the root of your catkin workspace and building, e.g.

    $ cd ~/catkin_ws && catkin build ahg_common spot_simulation

## Running

You should now be able to bring up the simulation with:

    $ roslaunch spot_gazebo spot_ahg_nav.launch
    
Close RViz when it comes up. Then, in a new terminal:

    $ rostopic pub /autonomy_arbiter/enabled std_msgs/Bool "data: true"
   
Then, ctrl+c when prompted. Send a goal with: 

    $ rostopic pub /move_base_simple/goal amrl_msgs/Pose2Df "x: 30.0 
    y: 30.0
    theta: 0.0"
    
Note: In this example, the default map for the navigation stack is the UT Campus, but the Gazebo simulation is in AHG. This means the robot will crash into a wall likely and its motion will be stopped.

## Interacting
Please see this package's github wiki page(s) for specifics on how to command the robot and retrieve navigation information
