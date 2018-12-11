# docker build -t gm2:sl6 -f gm2-sl6.dockerfile .

FROM sl:6
MAINTAINER Adam Lyon <lyon@fnal.gov>

# docker tag 1213 imageregistry.fnal.gov/egp/interactive-sl6:1.0

# The current version of Scientific Linux is 6.10

# Install packages (comments below refer to the lines in yum install)
#    Basic packages to run g-2 code
#    X11 and OpenGL to run Geant and Root
#    Additional packages for Root
#    Nice things to have
RUN yum update -y && \
    yum install -y \
        nc \
	  		epel-release \
        redhat-lsb-core \
        perl expat-devel glibc-devel gdb time git \
        freetype-devel libXpm-devel libXmu-devel mesa-libGL-devel mesa-libGLU-devel \
        libjpeg libpng \
        tar zip xz bzip2 patch \
        openssl-devel \
        wget emacs which sudo strace && \
    yum clean all

# Got the right repo from http://ftp.scientificlinux.org/linux/fermi/slf6x/readme.html
COPY slf6x.repo /etc/yum.repos.d/slf.repo
RUN wget http://ftp.scientificlinux.org/linux/fermi/slf6.10/x86_64/os/RPM-GPG-KEY-sl && \
    rpm --import RPM-GPG-KEY-sl && \
    rm -f RPM-GPG-KEY-sl && \
		yum install -y krb5-fermi-base cigetcert fermilab-util_kx509 && \
    yum clean all

#
# # Install the Fermilab krb5.conf
# RUN wget http://metrics.fnal.gov/authentication/krb5conf/Linux/krb5.conf -O /etc/krb5.conf

# Install the opensciencegrid client for voms-proxy-init
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm ;\
    rpm -Uvh https://repo.opensciencegrid.org/osg/3.4/osg-3.4-el6-release-latest.rpm ; \
    yum install -y osg-wn-client ;\
		yum clean all


# Install a few more things (was for netdata)
RUN yum -y install zlib-devel libuuid-devel libmnl-devel gcc make git autoconf \
               autoconf-archive autogen automake pkgconfig curl && \
		yum clean all

# UPS gets the flavor of the machine running docker instead of the docker container.
#   We can force the correct flavor with UPS_OVERRIDE
#   Note that mrb changes UPS_OVERRIDE (adding the -B). The mrb code has been updated
#   to copy UPS_FLAVOR_OVERRIDE into UPS_OVERRIDE when necessary.
ENV UPS_FLAVOR_OVERRIDE "-H Linux64bit+2.6-2.12"
ENV UPS_OVERRIDE $UPS_FLAVOR_OVERRIDE

# Create a me user (UID and GID should match the Mac user), add to suoders, and switch to it
ENV USERNAME me

# Pass in the user ID :and the group ID to use
ARG MYUID
ENV MYUID ${MYUID:-1000}
ARG MYGID
ENV MYGID ${MYGID:-100}

RUN useradd -u $MYUID -g $MYGID -ms /bin/bash $USERNAME && \
      echo "$USERNAME ALL=(ALL)   NOPASSWD:ALL" >> /etc/sudoers

USER $USERNAME
WORKDIR /home/$USERNAME

USER root
RUN mkdir /pnfs && mkdir /cvmfs && mkdir /gm2
USER $USERNAME

# For gdbserver
EXPOSE 9091
