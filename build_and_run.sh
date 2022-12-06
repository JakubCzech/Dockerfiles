#!/bin/bash
docker build -t tb3:noetic .
xhost +
docker run -it --name=$1 \
--ulimit memlock=-1 \
--privileged --env="QT_X11_NO_MITSHM=1" \
-v /home/$SUDO_USER/Shared:/root/Shared:rw \
--device=/dev/dri:/dev/dri --device=/dev/video0 \
--env="DISPLAY=$DISPLAY" --network=host \
tb3:noetic bash