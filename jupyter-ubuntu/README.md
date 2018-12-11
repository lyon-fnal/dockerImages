# jupyter-ubuntu

This image adds Anaconda3 Python and Jupyter (notebook and lab) to `vscode-ubuntu`. The default start up command is to run a Jupyter lab server on port `8888`. 

If you want to run a Jupyter Lab server, do

```bash
docker run -it --rm -p 8888:8888 -v $PWD:/work jupyter-ubuntu
```

Jupyter will serve `/work`. 

Note that the VNC server will not run. If you want to run the VNC server, then add the appropriate `-p 5901:5901` and/or `-p 6901:6901` (for no-vnc) and, at the end of the command above, add `--wait`.  You can now do things like start VSCode with `code`. 

If you want to run Jupyter lab and VNC, then follow the above paragraph to start in VNC, pop a terminal window, and run, 
```bash
jupyter lab --no-browser --ip 0.0.0.0
```
(you need that `--ip` option for jupyter to serve outside of the container to your host machine).