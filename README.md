# Adam's Docker Images

This is my repository for my docker image sources. 

## Quantum Computing Tools

There are lots of quantum computing tools out there. I'm trying to collect them all in one gigantic image.  Fun!

There are a chain of images. The dependency moves to the right. 

```
(Prepend everything with lyonfnal/)

vnc-ubuntu --> vscode-ubuntu --> jupyter-ubuntu --> qc-python-ubuntu
                              \--> qsharp-vscode-ubuntu
```

For instructions, see the following...

* [qc-python-ubuntu](qc-python-ubuntu/README.md) for Quantum Computing Python tools in Jupyter and Visual Studio Code
* [jupyter-ubuntu](jupyter-ubuntu/README.md) for base Jupyter server
* [qsharp-vscode-ubuntu](qsharp-vscode-ubuntu/README.md) for Microsoft QSharp in Visual Studio Code
* [vscode-ubuntu](vscode-ubuntu/README.md) for base Microsoft Visual Studio Code
* [vnc-ubuntu](vnc-ubuntu/README.md) for VNC running in Ubuntu


## Muon g-2 Development Environment

See [gm2-sl6](gm2-sl6/README.md).

