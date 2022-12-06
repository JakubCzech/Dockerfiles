colcon build
ros2 run teleop_twist_keyboard teleop_twist_keyboard --ros-args -r __ns:=/drone1
ros2 service call /drone1/tello_action tello_msgs/TelloAction "{cmd: 'land'}"
ros2 service call /drone1/tello_action tello_msgs/TelloAction "{cmd: 'takeoff'}" 
ros2 service call /reset_simulation std_srvs/srv/Empty

