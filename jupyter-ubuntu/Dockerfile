# jupyter-ubuntu
# Adds Anaconda and Jupyter to vscode-ubuntu

# docker build -t lyonfnal/jupyter-ubuntu .

FROM lyonfnal/vscode-ubuntu

LABEL maintainer="lyon@fnal.gov"

USER 0

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git

# Port for Jupyter
EXPOSE 8888

USER 1000

# Will install to /headless/anaconda3

# Install Anaconda
RUN cd /headless && \
    wget --quiet https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b && \
    rm ~/anaconda.sh

# Hook up the startup to .bashrc
RUN echo ". /headless/anaconda3/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

# In wm_startup.sh, need to remove anaconda from the path or else get DBUS error in the windows manager
RUN sed -i '1iexport PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' ~/wm_startup.sh

# Upgrade and install some stuff
RUN . /headless/anaconda3/etc/profile.d/conda.sh && \
    conda activate base && \
    pip install --upgrade pip && \
    pip install rise && \
    jupyter-nbextension install rise --py --sys-prefix && \
    jupyter-nbextension enable rise --py --sys-prefix


# Switch to /work
WORKDIR /work

CMD ["--skip", "jupyter", "lab", "--no-browser", "--ip", "0.0.0.0"]