# Instructions for the Fermilab Quantum Computing Tutorials

You can run the Jupyter Notebooks and your own stuff locally in a Docker container. This is the most reliable way to run, especially if you have a descent laptop.

Note that you do not need to clone this (`lyon-fnal/dockerImages`) repository.

## Installation
First, you need to install Docker on your laptop. See https://www.docker.com/products/docker-desktop for Mac and Windows installations (most of you should follow those instructions). For more information and installation on a Linux laptop, see https://docs.docker.com/install/ (expand the Linux heading on the left side contents bar). There are installations instructions for many Linux platforms. 

With Docker installed and running, pull the `lyonfnal/qc-python-ubuntu` image with (from a terminal window on your laptop),

```bash
docker pull lyonfnal/qc-python-ubuntu
```

It is big (about 5 GB) and so may take awhile to download. 

You can check that you have it with 

```bash
docker images
```
Finally, you should create a directory somewhere on your laptop fr your Quantum Computing work. You should also pull the git repository for the tutorials. That is, 

```bash
mkdir somewhere/MyQuantumComputingStuff
cd somewhere/MyQuantumComputingStuff
git clone https://github.com/lyon-fnal/qc-tutorial-fnal.git
cd qc-tutorial-fnal
```

## Running Jupyter Notebooks

Go to your working Quantum Computing directory. Perhaps,

```bash
cd somewhere/MyQuantumComputingStuff/qc-tutorial-fnal
```

Now start the docker container in Jupyter Notebook mode using that directory...

```bash
docker run -it --rm -v $PWD:/work -p 8888:8888 lyonfnal/qc-python-ubuntu
```

Jupyter Lab will start up and you'll see something like

```
Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://(82dd5a3e461a or 127.0.0.1):8888/?token=45efb72b443e64315953047f7f6605b10cf49103fe1ae2d2
```

Your token will be different. To access Jupyter Lab, use your laptop's browser to access

```
http://localhost:8888/?token=...
```

Where the `...` is the token from the message (cut and paste it). 

If you want to do something special, like run VNC and use Microsoft Visual Studio Code, you should see [here](qc-python-ubuntu/README.md).


