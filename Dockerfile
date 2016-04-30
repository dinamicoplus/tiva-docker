FROM ubuntu:14.04

MAINTAINER Marcos Brito <marbri91@gmail.com>

ARG gnu_tools
ARG tivaware_pkg

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y flex bison libgmp3-dev libmpfr-dev \
    libncurses5-dev libmpc-dev autoconf texinfo build-essential \
    libftdi-dev python-yaml zlib1g-dev libtool
RUN apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386
RUN apt-get install -y libusb-1.0-0 libusb-1.0-0-dev
RUN apt-get install -y wget vim git unzip pkg-config

RUN mkdir ~/Embedded
COPY $gnu_tools.tar.bz2 .
RUN tar -xvf $(echo $gnu_tools).tar.bz2 -C ~/Embedded
RUN mkdir ~/Embedded/tivaware
COPY $tivaware_pkg . 
RUN unzip $tivaware_pkg -d ~/Embedded/tivaware

ENV PATH $PATH:/root/Embedded/$gnu_tools/bin
RUN echo $PATH

RUN cd ~/Embedded/tivaware && make

RUN cd ~/Embedded && git clone https://github.com/uctools/tiva-template.git

RUN cd ~/Embedded && git clone git://github.com/utzig/lm4tools.git
RUN cd ~/Embedded/lm4tools/lm4flash/ && make

RUN cd ~/Embedded && git clone http://openocd.zylin.com/openocd
RUN cd ~/Embedded/openocd && git fetch http://openocd.zylin.com/openocd refs/changes/63/2063/1 && git checkout FETCH_HEAD && git submodule init && git submodule update
RUN cd ~/Embedded/openocd && ./bootstrap && ./configure --enable-ti-icdi --prefix=`pwd`/.. && make -j3 && make install

RUN cd /etc/udev/rules.d && echo "SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"1cbe\", ATTRS{idProduct}==\"00fd\", MODE=\"0660\"" | tee 99-tiva-launchpad.rules
