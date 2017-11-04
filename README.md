# Google Chrome

This repository is based on https://github.com/chrisdaish/docker-chrome

Unofficial build of Google Chrome 50 running within a docker container and
rendered by the local X Server.

## Launch Command

```
docker run --privileged \
  -v $HOME/Downloads:/home/google-chrome/Downloads:rw \
  -v $HOME/.config/google-chrome:/home/google-chrome/.config/google-chrome:rw \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/snd:/dev/snd \
  -v /dev/shm:/dev/shm \
  --privileged \
  -e uid=$(id -u) \
  -e gid=$(id -g) \
  -e DISPLAY=unix$DISPLAY \
  --rm \
  chrome:latest
```

## FAQ

Note: If you receive the following Gtk error:

```
Gtk-WARNING **: cannot open display: unix:0.0
```

Simply allow the docker user to communicate with your X session

```
xhost +local:docker
```
