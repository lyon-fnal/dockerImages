# Microsoft Q-Sharp and Visual Studio Code in VNC and Ubuntu

Based on `vscode-ubuntu` image (Dockerfile is in this repository). 

Run with,

```bash
docker run -e VNC_PW=your_password -it --rm -p 6901:6901 -p 5901:5901 qsharp-vscode-ubuntu
```

See `../vscode-ubuntu/README.md` for more information. 

Run `vscode` by popping a terminal and executing `code`. Or, adding `bash` to the end of the command line and running `code` in that shell. 