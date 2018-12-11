# Visual Studio Code in VNC and Ubuntu

Based on `lyonfnal/vnc-ubuntu` image (Dockerfile is in this repository). 

Run with,

```bash
docker run -e VNC_PW=your_password -it --rm -p 6901:6901 -p 5901:5901 -v $PWD:/work lyonfnal/vscode-ubuntu
```

See [lyonfnal/vnc-ubuntu](../vnc-ubuntu/README.md) for more information. 

Run Microsoft Visual Studio Code by popping a terminal and executing `code`. Or, adding `bash` to the end of the command line and running `code` in that shell. 