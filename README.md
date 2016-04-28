# TIVA Dockerfile

This repository contains **Dockerfile** to set an enviroment for developers of **Tiva C series TM4C123GXL Launchpad** from Texas Instrument.

## Base Docker Image

- [ubuntu:14.04](https://registry.hub.docker.com/u/library/ubuntu/)

## Installation

1. Install [Docker](https://www.docker.com/).

2. Build the image from Dockerfile:
`docker build -t="dinamicoplus/tiva" github.com/dinamicoplus/tiva-docker`

## Usage

`docker run -i -r dinamicoplus/tiva`
