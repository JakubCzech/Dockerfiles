FROM osrf/ros:noetic-desktop-full

LABEL Maintainer="Jakub Czech <czechjakub@icloud.com>"
LABEL Description="Turtlebot ROS2 Humble Image"

ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DISTRO=noetic
ENV TURTLEBOT3_MODEL=burger

RUN ./ros_entrypoint.sh
RUN apt-get update
RUN apt-get install -y apt-utils \
    ros-$ROS_DISTRO-turtlebot3 \
    ros-$ROS_DISTRO-turtlebot3-msgs \
    ros-$ROS_DISTRO-turtlebot3-gazebo \
    ros-${ROS_DISTRO}-rqt-* ros-${ROS_DISTRO}-joy ros-${ROS_DISTRO}-teleop-twist-joy \
    ros-${ROS_DISTRO}-teleop-twist-keyboard ros-${ROS_DISTRO}-laser-proc ros-${ROS_DISTRO}-rgbd-launch \
    ros-${ROS_DISTRO}-depthimage-to-laserscan ros-${ROS_DISTRO}-rosserial-arduino \
    ros-${ROS_DISTRO}-rosserial-python ros-${ROS_DISTRO}-rosserial-server ros-${ROS_DISTRO}-rosserial-client \
    ros-${ROS_DISTRO}-rosserial-msgs ros-${ROS_DISTRO}-amcl ros-${ROS_DISTRO}-map-server ros-${ROS_DISTRO}-move-base \
    ros-${ROS_DISTRO}-urdf ros-${ROS_DISTRO}-xacro ros-${ROS_DISTRO}-compressed-image-transport ros-${ROS_DISTRO}-rqt-image-view \
    ros-${ROS_DISTRO}-gmapping ros-${ROS_DISTRO}-navigation ros-${ROS_DISTRO}-interactive-markers ros-${ROS_DISTRO}-dwa-local-planner \
    ros-${ROS_DISTRO}-multirobot-map-merge ros-${ROS_DISTRO}-explore-lite \
    terminator
RUN apt-get autoclean -y
RUN apt-get autoremove -y 
RUN apt-get clean
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc

WORKDIR /root/workspace
VOLUME /dev/shm /dev/shm
