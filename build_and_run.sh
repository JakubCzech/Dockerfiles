#!/bin/bash
docker build -t visualization:humble .
xhost +
docker run -it --name=visualization_humble \
--ulimit memlock=-1 \
--privileged --env="QT_X11_NO_MITSHM=1" \
-v "$(pwd)"/src/default.rviz:/root/.rviz2/default.rviz:rw \
-v "$(pwd)"/src/Pos_Vel.perspective:/root/workspace/Pos_Vel.perspective:rw \
--device=/dev/dri:/dev/dri --device=/dev/video0 \
--env="DISPLAY=$DISPLAY" --network=host \
visualization:humble bash