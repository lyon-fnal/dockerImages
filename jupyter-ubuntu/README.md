# jupyter-ubuntu

This image adds Anaconda3 Python and Jupyter (notebook and lab) to `vscode-ubuntu`. The default start up command is to run a Jupyter lab server on port `8888`. 

If you want to run a Jupyter Lab server, do

```bash
docker run -it --rm -p 8888:8888 -v $PWD:/work lyonfnal/jupyter-ubuntu
```

Jupyter will serve `/work`. 

Note that the VNC server will not run. If you want to run the VNC server, then add the appropriate `-p 5901:5901` and/or `-p 6901:6901` (for no-vnc) and, `-e VNC_PW=your_password`, and at the end of the command above, add `--wait`. For example,

```bash
# Run VNC and start jupyter later
docker run -it --rm -e VNC_PW=your_password -p 8888:8888 -p 5901:5901 -p 6901:6901 -v $PWD:/work lyonfnal/jupyter-ubuntu --wait
```

You can start Visual Studio Code with `code` from a terminal. 

If you want to run Jupyter lab and VNC, then follow the above paragraph to start in VNC, pop a terminal window, and run, 
```bash
jupyter lab --no-browser --ip 0.0.0.0
```
(you need that `--ip` option for jupyter to serve outside of the container to your host machine).

If you just want a bash shell and nothing else, do,

```bash
docker run -it --rm -v $PWD:/work jupyter-ubuntu --skip bash
```

Add appropriate `-p` and other options if you want to run VNC or Jupyter later within the shell. 