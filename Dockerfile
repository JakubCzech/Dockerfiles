FROM osrf/ros:foxy-desktop
LABEL org.opencontainers.image.authors="czechjakub@icloud.com"

RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y
RUN apt install -y \
    libasio-dev git python3-pip \
    ros-foxy-cv-bridge ros-foxy-camera-calibration-parsers ros-foxy-gazebo-ros-pkgs

RUN pip3 install transformations opencv-python opencv-contrib-python scipy

RUN mkdir -p /root/tello_ws/src
WORKDIR /root/tello_ws/src
RUN git clone https://github.com/clydemcqueen/tello_ros.git
RUN git clone https://github.com/ptrmu/ros2_shared.git
RUN git clone https://github.com/JMU-ROBOTICS-VIVA/ros2_aruco.git

WORKDIR /root/tello_ws
# Build all
RUN . /opt/ros/foxy/setup.sh && \
    colcon build --symlink-install
# Add start script
ADD ./src_files/start.sh .
ADD ./src_files/.bash_history /root/.bash_history
RUN echo "source /opt/ros/foxy/setup.sh" >> ~/.bashrc
RUN echo "source /root/tello_ws/install/setup.bash" >> ~/.bashrc

