# Google Chrome

This repository is based on https://github.com/chrisdaish/docker-chrome

Unofficial build of Google Chrome 64 running within a docker container and
rendered by the local X Server.

## Launch Command

```
  ./chrome            # start docker chrome with persistance to ~/.config/google-chrome
  ./chrome --clean    # start docker chrome with no persistance other than Downloads
  ./chrome --net      # start docker chrome with host networking
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
