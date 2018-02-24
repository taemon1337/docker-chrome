#!/bin/bash

if [ "$1" == "--clean" ]; then
 docker run --privileged \
  -v $HOME/Downloads:/home/google-chrome/Downloads:rw \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/snd:/dev/snd \
  -v /dev/shm:/dev/shm \
  -e uid=$(id -u) \
  -e gid=$(id -g) \
  -e DISPLAY=unix$DISPLAY \
  --rm \
  chrome:latest
else
 docker run --privileged \
  -v $HOME/Downloads:/home/google-chrome/Downloads:rw \
  -v $HOME/.config/google-chrome:/home/google-chrome/.config/google-chrome:rw \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/snd:/dev/snd \
  -v /dev/shm:/dev/shm \
  -e uid=$(id -u) \
  -e gid=$(id -g) \
  -e DISPLAY=unix$DISPLAY \
  --rm \
  chrome:latest
fi
