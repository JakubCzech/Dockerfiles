FROM ros:humble-ros-core-jammy

LABEL Maintainer="Jakub Czech <czechjakub@icloud.com>"
LABEL Description="Navigation for ROS2 Humble"

ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DOMAIN_ID=33

RUN ./ros_entrypoint.sh
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y
RUN apt-get install -y apt-utils \
    ros-$ROS_DISTRO-navigation2 \
    ros-$ROS_DISTRO-nav2-bringup

RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
VOLUME /dev/shm /dev/shm
RUN mkdir -p /root/workspace/src
WORKDIR /root/workspace
