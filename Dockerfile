FROM osrf/ros:humble-simulation

LABEL Maintainer="Jakub Czech <czechjakub@icloud.com>"
LABEL Description="Visualization for Navigation in ROS2 Humble Image"

ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DISTRO=humble

RUN ./ros_entrypoint.sh
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y
RUN apt-get install -y apt-utils \
    ros-$ROS_DISTRO-rviz2 \
    ros-$ROS_DISTRO-rqt*
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
ENV ROS_DOMAIN_ID=33

WORKDIR /root/workspace
VOLUME /dev/shm /dev/shm
VOLUME ./src:/root/workspace/

