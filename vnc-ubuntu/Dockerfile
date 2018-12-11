# Builds an ubuntu:latest image with VNC (and no-VNC) capability with 
# XFCE window manager

# docker build -t vnc-ubuntu .

# Based on work by Simon Hofmann "simon.hofmann@consol.de" (thanks!)

FROM ubuntu:latest

LABEL maintainer="lyon@fnal.gov"

## Connection ports for controlling the UI:
# VNC port:5901
# noVNC webport, connect via http://IP:6901/?password=vncpassword
ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901

EXPOSE $VNC_PORT $NO_VNC_PORT

### Envrionment config
ENV HOME=/headless \
    TERM=xterm \
    STARTUPDIR=/dockerstartup \
    INST_SCRIPTS=/headless/install \
    NO_VNC_HOME=/headless/noVNC \
    DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1280x1024 \
    VNC_PW=vncpassword \
    VNC_VIEW_ONLY=false
WORKDIR $HOME

# From tools.sh
RUN apt-get update && \
    apt-get install -y vim wget net-tools locales bzip2 python-numpy && \
    apt-get clean -y && \
    locale-gen en_US.UTF-8

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# From install_custom_fonts.sh
RUN apt-get install -y ttf-wqy-zenhei

# From tigervnc.sh
RUN wget -qO- https://dl.bintray.com/tigervnc/stable/tigervnc-1.8.0.x86_64.tar.gz | tar xz --strip 1 -C /

# From no_vnc.sh
RUN mkdir -p $NO_VNC_HOME/utils/websockify && \
    wget -qO- https://github.com/novnc/noVNC/archive/v1.0.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME && \
    wget -qO- https://github.com/novnc/websockify/archive/v0.6.1.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME/utils/websockify && \
    chmod +x -v $NO_VNC_HOME/utils/*.sh && \
    ln -s $NO_VNC_HOME/vnc_lite.html $NO_VNC_HOME/index.html

# From xfce_ui.sh
RUN apt-get install -y supervisor xfce4 xfce4-terminal xterm && \
    apt-get purge -y pm-utils xscreensaver* && \
    apt-get clean -y

# From libnss_wrapper.sh
RUN apt-get install -y libnss-wrapper gettext && \
    apt-get clean -y && \
    echo 'source $STARTUPDIR/generate_container_user' >> $HOME/.bashrc

ADD ./scripts $STARTUPDIR

# From set_user_permission.sh
RUN find $STARTUPDIR/ -name '*.sh' -exec chmod $verbose a+x {} + && \
    find $STARTUPDIR/ -name '*.desktop' -exec chmod $verbose a+x {} + && \
    chgrp -R 0 $STARTUPDIR && chmod -R $verbose a+rw $STARTUPDIR && find $STARTUPDIR -type d -exec chmod $verbose a+x {} +

RUN find $HOME/ -name '*.sh' -exec chmod $verbose a+x {} + && \
    find $HOME/ -name '*.desktop' -exec chmod $verbose a+x {} + && \
    chgrp -R 0 $HOME && chmod -R $verbose a+rw $HOME && find $HOME -type d -exec chmod $verbose a+x {} +

# Add the window manager startup script
ADD wm_startup.sh $HOME/
RUN chmod a+x $HOME/wm_startup.sh

# Add /work for easy connecting to outside volume
RUN mkdir /work && \
    chown 1000 /work
    
USER 1000

ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]
CMD ["--wait"]