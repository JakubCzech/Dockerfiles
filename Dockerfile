FROM osrf/ros:galactic-desktop-focal


LABEL Maintainer="Jakub Czech <czechjakub@icloud.com>"
LABEL Description="Turtlebot ROS2 Galactic Image"

ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DISTRO=galactic
ENV TURTLEBOT3_MODEL=burger
ENV ROS_DOMAIN_ID=33

RUN ./ros_entrypoint.sh
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y
RUN apt-get install -y apt-utils \
    ros-$ROS_DISTRO-turtlebot3 \
    ros-$ROS_DISTRO-turtlebot3-*
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc

WORKDIR /root/workspace
VOLUME /dev/shm /dev/shm
VOLUME ./src:/root/workspace/
