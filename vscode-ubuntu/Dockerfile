#  Adds Microsoft Visual Studio Code to vnc-ubuntu
#
# docker build -t lyonfnal/vscode-ubuntu .
#
#  Note, VSCode won't run on RHEL6 - it needs RHEL7
#
FROM lyonfnal/vnc-ubuntu

MAINTAINER Adam Lyon lyon@fnal.gov

USER 0

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install apt-utils 
RUN apt-get -y install wget libnotify4 libnss3 gnupg libxkbfile1 \
         libgconf-2-4 libsecret-1-0 libgtk-3-0 libxss1 libasound2

RUN cd /home && \
   wget https://go.microsoft.com/fwlink/?LinkID=760868 -O  code.deb && \
   dpkg -i code.deb && \
   rm -f code.deb

USER 1000
