# vnc-ubuntu

Image with `ubuntu:latest` and a VNC server (and running no-vnc) and the xfce window manager.

Based on https://github.com/ConSol/docker-headless-vnc-container 

## Running

The easy way to run with all features is,

```bash
docker run -e VNC_PW=your_password -it --rm -p 6901:6901 -p 5901:5901 -v $PWD:/work lyonfnal/vnc-ubuntu
```

Replace `your_password` with the VNC password you want to use. Start the container in the directory you want to have access to as `/work`. You can also give an explicit path instead of `$PWD`. 

The command will not return. You can quit the server with Ctrl-C. 

Add `-h` at the end to see all the options. 

You can remove `-p 6901:6901` if you do not need no-vnc. You can remove `-p 5901:5901` if you only want no-vnc. 

You can also add `bash` to the end of the command line, like

```bash
docker run -e VNC_PW=your_password -it --rm -p 6901:6901 -p 5901:5901 vnc-ubuntu bash
```

and that will run a bash shell in your non-graphical terminal window with the VNC server running in the background. You can pop graphics programs from that non-graphical terminal and they will show up in the VNC viewer. 

## Viewing

The startup script will report connection information. The IP address will be incorrect. Just replace it with `localhost`. 

With the container running, you can access VNC with a client looking at `localhost:5901`. You can use no-vnc by opening your browser to `http://localhost:6901`.