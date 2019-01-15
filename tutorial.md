# Instructions for the Fermilab Quantum Computing Tutorials

You can run the Jupyter Notebooks and your own stuff locally in a Docker container. This is the most reliable way to run, especially if you have a decent laptop.

Note that you do not need to clone this (`lyon-fnal/dockerImages`) repository.

## 1. Installation
First, you need to install Docker on your laptop. See https://www.docker.com/products/docker-desktop for Mac and Windows installations (most of you should follow those instructions). For more information and installation on a Linux laptop, see https://docs.docker.com/install/ (expand the Linux heading on the left side contents bar). There are installations instructions for many Linux platforms. 

Note that you may want to check the Docker preferences and set the number of CPUs and memory accordingly. I have a 6 core laptop with 32 GB of memory and I give Docker 6 CPUs and 16 GB of memory.

### 1.1 Lock down the Docker network

When you tell docker to forward a port from your container to your host, that port will be accessible to the outside world unless your host blocks outside access. The Mac by default will block outside access, but Windows may not and Linux hosts will not unless you have `iptables` or something like that set up. You can configure Docker itself to only allow your host to access forwarded docker ports and not allow outside access. You should do this...

#### 1.1.1 Mac and Windows
On Mac and Windows, go to the Docker Application and pull up preferences (menu Docker -> Preferences). Go to the Daemon tab and click on the Advanced pane. There will be a JavaScript snipit there. Add the following line or, if it is there, change the `ip` line to...

```
"ip": "127.0.0.1",
```

Then click on "Apply and Restart"

#### 1.1.2 Linux

See https://docs.docker.com/engine/reference/commandline/dockerd/#miscellaneous-options and search on that page for "Daemon configuration file". That will say where the config file is located. Make the change to the `ip` line (or add as per above if is not there). Then restart the docker daemon on your system. 

### 1.2 Pull the image

With Docker installed and running, pull the `lyonfnal/qc-python-ubuntu` image with (from a terminal window on your laptop),

```bash
docker pull lyonfnal/qc-python-ubuntu
```

It is big (about 5 GB) and so may take awhile to download. 

You can check that you have it with 

```bash
docker images
```
Finally, you should create a directory somewhere on your laptop for your Quantum Computing work. You should also pull the git repository for the tutorials. That is, 

```bash
mkdir somewhere/MyQuantumComputingStuff
cd somewhere/MyQuantumComputingStuff
git clone https://github.com/lyon-fnal/qc-tutorial-fnal.git
cd qc-tutorial-fnal
```

## 2. Running Jupyter Notebooks

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
        http://127.0.0.1:8888/token=45efb72b443e64315953047f7f6605b10cf49103fe1ae2d2
```

Your token will be different. To access Jupyter Lab, use your laptop's browser and copy and paste that URL.

If you want to do something special, like run VNC and use Microsoft Visual Studio Code, you should see [here](qc-python-ubuntu/README.md).
