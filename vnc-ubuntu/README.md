# vnc-ubuntu

Image with `ubuntu:latest` and a VNC server (and running no-vnc) and the xfce window manager.

Based on https://github.com/ConSol/docker-headless-vnc-container 

## Running

The easy way to run with all features is,

```bash
docker run -e VNC_PW=your_password -it --rm -p 6901:6901 -p 5901:5901 vnc-ubuntu
```

Replace `your_password` with the VNC password you want to use. 

The command will not return. You can quit the server with Ctrl-C. 

Add `-h` at the end to see all the options. 

You can remove `-p 6901:6901` if you do not need no-vnc. You can remove `-p 5901:5901` if you only want no-vnc. 

## Viewing

The startup script will report connection information. The IP address will be incorrect. Just replace it with `localhost`. 

With the container running, you can access VNC with a client looking at `localhost:5901`. You can use no-vnc by opening your browser to `http://localhost:6901`.