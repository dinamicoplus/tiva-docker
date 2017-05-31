# TIVA Dockerfile

This repository contains **Dockerfile** to set an enviroment for developers of **Tiva C series TM4C123GXL Launchpad** from Texas Instrument. Basically it follows setup instructions from [chrisrm.com](http://chrisrm.com/howto-develop-on-the-ti-tiva-launchpad-using-linux/).

#### Base Docker Image: [ubuntu:14.04](https://registry.hub.docker.com/u/library/ubuntu/)

## Installation

1. Install [Docker](https://www.docker.com/).

2. Clone this repository into your machine:
```
   git clone https://github.com/dinamicoplus/tiva-docker.git
   cd tiva-docker
```

3. Go to [GNU Tools for ARM Embedded Processors](https://launchpad.net/gcc-arm-embedded/+download) and download the most recent tarball for Linux placing it in the same directory.

4. Go to [Tiva C Series Software](http://software-dl.ti.com/tiva-c/SW-TM4C/latest/index_FDS.html) and download the “TivaWare for Tiva C Series” package: **SW-TM4C-X.X.X.exe** Place it in the same directory.

5. Set **gnu_tools** and **tivaware_pkg** with the path to the previous downloaded packages respectively and build the image from Dockerfile:
```
   export gnu_tools=<gnu_tools.tar.bz2>
   export tivaware_pkg=<SW-TM4C-X.X.X.exe>
```
```
   docker build --build-arg gnu_tools=$gnu_tools --build-arg tivaware_pkg=$tivaware_pkg -t="dinamicoplus/tiva" .
```
## Usage

`docker run -i -r dinamicoplus/tiva`

## Building Firmware

We’ll be building a simple blinking LED app using the example source code and makefile included in the Tiva Template.

1. Go to the project folder:
```
   cd ~/Embedded/tiva-template/src
```

2. Configure the project’s Makefile with an text editor as follows:
```
#######################################
# user configuration:
#######################################
# TARGET: name of the output file
TARGET = main
# MCU: part number to build for
MCU = TM4C123GH6PM
# SOURCES: list of input source sources
SOURCES = main.c startup_gcc.c
# INCLUDES: list of includes, by default, use Includes directory
INCLUDES = -IInclude
# OUTDIR: directory to use for output
OUTDIR = build
# TIVAWARE_PATH: path to tivaware folder
TIVAWARE_PATH = $(HOME)/Embedded/tivaware
```
 
3. Run make to build the app:
```
make
```

## Flashing

1. Run this to flash over USB:
```
cd ~/Embedded/lm4tools/lm4flash/
./lm4flash ~/Embedded/tiva-template-master/build/main.bin
```

