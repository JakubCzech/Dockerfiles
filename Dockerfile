FROM osrf/ros:humble-simulation-jammy

LABEL Maintainer="Jakub Czech <czechjakub@icloud.com>"
LABEL Description="Turtlebot ROS2 Humble Image"

ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DISTRO=humble
ENV TURTLEBOT3_MODEL=burger
ENV ROS_DOMAIN_ID=33

RUN ./ros_entrypoint.sh
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y
RUN apt-get install -y apt-utils \
    ros-$ROS_DISTRO-turtlebot3 \
    ros-$ROS_DISTRO-turtlebot3-gazebo
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc

WORKDIR /root/workspace
VOLUME /dev/shm /dev/shm
VOLUME ./src:/root/workspace/
