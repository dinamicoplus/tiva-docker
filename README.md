# TIVA Dockerfile

This repository contains **Dockerfile** to set an enviroment for developers of **Tiva C series TM4C123GXL Launchpad** from Texas Instrument. Basically it follows setup instructions from [chrisrm.com](http://chrisrm.com/howto-develop-on-the-ti-tiva-launchpad-using-linux/).

#### Base Docker Image: [ubuntu:14.04](https://registry.hub.docker.com/u/library/ubuntu/)

## Installation

1. Install [Docker](https://www.docker.com/).

2. Go to [GNU Tools for ARM Embedded Processors](https://launchpad.net/gcc-arm-embedded/+download) and download the most recent tarball for Linux.

3. Go to [Tiva C Series Software](http://software-dl.ti.com/tiva-c/SW-TM4C/latest/index_FDS.html) and download the “TivaWare for Tiva C Series” package: **SW-TM4C-X.X.X.exe**

4. Set **gnu_tools** and **tivaware_pkg** with the path to the previous downloaded packages respectively and build the image from Dockerfile:
```
   export gnu_tools = <gnu_tools.tar.bz2>
   export tivaware_pkg = <SW-TM4C-X.X.X.exe>
```
```
   docker build --build-arg gnu_tools=$gnu_tools --build_arg tivaware_pkg=$tivaware_pkg -t="dinamicoplus/tiva" github.com/dinamicoplus/tiva-docker
```
## Usage

`docker run -i -r dinamicoplus/tiva`
