Apptainer and HPC
=======================

<span style="color:red"> TODO: add brief description of what this is any why HPC users would care. </span>

This is an example workflow to:

1. Build a podman contianer which can run [R-INLA](https://www.r-inla.org/) (should work more or less the same as docker)
2. Convert the podman container to a .sif file with apptainer (compatible with HPC)
3. Run the apptainer container

The file produced by these scripts is also available for direct download [here](https://iowa-my.sharepoint.com/:u:/g/personal/gown_uiowa_edu/EfEE_LzBwT1Hizcqc3OSotoBrD01geyodN_iUhrPnEZWwA?e=hf8bwe) for University students. 

Setup
=============

First, you'll need access to a Linux environment other than the HPC system, preferably with administrative access. 
Fortunately, this is fairly straightforward using WSL, which is available (with the help of IT) on campus Windows PCs. 

Installing Apptainer
-------------------------

More detailed instructions can be found [here](https://apptainer.org/docs/admin/main/installation.html), but 
a brief, self-contained setup can be had using the following steps. 


#### Make sure you have the prerequisites installed

Assuming you're running some flavor of Debian/Ubuntu, the command below (or something very similar) should
provide the prerequisites you need. We also include podman (and the docker CLI) here, since Docker container
definition files are much more common than .sif files, and if you're going to learn how to use containers
it's worth your time to start with those. Apptainer provides a way to convert between Docker images and 
SIF images, and while that may seem like extra steps it's probably worth doing for most users. 

```
sudo apt-get install -y \
    build-essential \
    libseccomp-dev \
    pkg-config \
    uidmap \
    squashfs-tools \
    squashfuse \
    fuse2fs \
    fuse-overlayfs \
    fakeroot \
    cryptsetup \
    curl \
    wget \
    git \
    rpm2cpio \
    podman \
    podman-docker
```

#### Run the apptainer installation script

Note that the following code pulls in a script and executes it, which is something you should 
only do from trusted sources. This version of the installation will create a folder called `apptainer`
in the current working directory where the software will be installed. 

```
mkdir apptainer
curl -s https://raw.githubusercontent.com/apptainer/apptainer/main/tools/install-unprivileged.sh | \
    bash -s apptainer
```

#### Update your path

```
# Update path
CWD=$(pwd)
echo "PATH=\$PATH:$CWD/apptainer/bin" >>  ~/.bash_profile
echo 'export PATH' >> ~/.bash_profile
source ~/.bash_profile
```

#### Test your installation

```
apptainer pull docker://ghcr.io/apptainer/lolcow
apptainer shell lolcow_latest.sif
apptainer exec lolcow_latest.sif cowsay moo
```
