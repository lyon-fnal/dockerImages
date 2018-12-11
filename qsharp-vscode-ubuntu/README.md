# Microsoft Q-Sharp and Visual Studio Code in VNC and Ubuntu

The Microsoft QSharp language is installed as well as the VSCode extension.

Based on [lyonfnal/vscode-ubuntu](../vscode-ubuntu/README.md) image. 

Run with,

```bash
docker run -e VNC_PW=your_password -it --rm -p 6901:6901 -p 5901:5901 qsharp-vscode-ubuntu
```

See [lyonfnal/vscode-ubuntu](../vscode-ubuntu/README.md) for more information. 

Run Microsoft Visual Studio Code by popping a terminal and executing `code`. Or, adding `bash` to the end of the command line above and running `code` in that shell. 