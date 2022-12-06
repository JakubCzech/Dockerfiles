#!/bin/bash
docker build -t tello:foxy .
xhost +
docker run -it --name=$1 \
--ulimit memlock=-1 \
--privileged --env="QT_X11_NO_MITSHM=1" \
-v /home/$SUDO_USER/Shared:/root/Shared:rw \
--device=/dev/dri:/dev/dri --device=/dev/video0 \
--device=/dev/shm:/dev/shm \
--env="DISPLAY=$DISPLAY" --network=host \
arl:foxy bash
