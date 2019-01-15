# gm2-sl6

Muon g-2 development environment. 

* Runs in Scientific Linux 6
* Uses host `/cvmfs`
* Uses host `/pnfs` (use sshfs)
* Has `/gm2` for a directory that is g-2 related
* Has a `/work` direcotry that you can do with what you want
* Has Kerberos
* Has OSG client for `voms-proxy-init`

## First time set up
These instructions are for your Mac. You can likely do something similar on a Windows PC.

* Install CVMFS on your Mac and configure it for the Fermilab CVMFS repositories. See https://cernvm.cern.ch/portal/filesystem/downloads . It looks like  the regular install of `CVMFS` now comes configured to access our Fermilab/OSG repositories. After the installation, you can test with `cd /cvmfs/gm2.opensciencegrid.org` and look for content. 

* Install SSHFS (if you want access to `/pnfs`). If you do not have Homebrew installed, install it by following the instructions at https://brew.sh . Then `brew install sshfs` . You'll need to create a mount point at `/pnfs`...
```bash
sudo mkdir /pnfs
sudo chown YOU /pnfs
sudo chgrp staff /pnfs
```
where `YOU` is your username on your Mac. 

* Install Docker
See https://docs.docker.com/docker-for-mac/install/

* Get this image
Do 
```bash
docker pull lyonfnal/gm2:sl6
```

## Running 

### Update your docker image
If you haven't done it for awhile, you can check if there's an update to the docker image. Do,
```bash
docker pull lyonfnal/gm2:sl6
```

### Set up sshfs
If you want access to `/pnfs`, then you'll need to set that up if it is not already...
```bash
ls /pnfs  # If empty, continue. If has content, then it's already mounted
kinit YOU@FNAL.GOV
sshfs YOU@gm2gpvm0N.fnal.gov:/pnfs /pnfs
```
where `YOU` is replaced with your Fermilab username and `gm2gpvm0N` is replaced by a real VM name, like `gm2gpvm01`. 

### Run in the container
I have a directory on my Mac called `/Users/lyon/Development/gm2` that I want accessible from the container as the `/gm2` directory. 

Run with 
```bash
cd ~/Development/gm2
docker run -it --rm -v $PWD:/gm2 -v /cvmfs:/cvmfs -v /pnfs:/pnfs lyonfnal/gm2:sl6
```
