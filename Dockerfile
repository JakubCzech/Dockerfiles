FROM osrf/ros:dashing-desktop

LABEL Maintainer="Jakub Czech <czechjakub@icloud.com>"
LABEL Description="Turtlebot ROS2 Dashing Image for Deep-Q Learning"

ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DISTRO=dashing
ENV TURTLEBOT3_MODEL=burger
ENV ROS_DOMAIN_ID=33

RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
RUN ./ros_entrypoint.sh

RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y
RUN apt-get install -y apt-utils git python3-pip python3-colcon-common-extensions
RUN apt-get install -y \
    ros-$ROS_DISTRO-dynamixel-sdk \
    ros-$ROS_DISTRO-action-msgs \
    ros-$ROS_DISTRO-gazebo-ros \
    ros-$ROS_DISTRO-gazebo-ros-pkgs

RUN pip3 install -U rosinstall msgpack empy defusedxml netifaces
RUN python3 -m pip install google-cloud-storage==1.24.1 protobuf==3.19.4 --user

RUN python3 -m pip install protobuf==3.19.4 --user
RUN pip3 install tensorflow
RUN pip3 install keras==2.1.5

RUN mkdir -p /root/workspace/src
WORKDIR /root/workspace/src
RUN git clone -b dashing-devel https://github.com/ROBOTIS-GIT/turtlebot3
RUN git clone -b dashing-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs
RUN git clone -b dashing-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations
RUN git clone -b ros2 https://github.com/ROBOTIS-GIT/turtlebot3_machine_learning.git
WORKDIR /root/workspace

RUN . /opt/ros/${ROS_DISTRO}/setup.sh && colcon build --symlink-install
RUN echo "source /root/workspace/install/setup.bash" >> ~/.bashrc
