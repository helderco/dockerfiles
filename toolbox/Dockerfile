FROM python:2.7
MAINTAINER Helder Correia <me@heldercorreia.com>

RUN curl -sL https://raw.githubusercontent.com/pixelb/ps_mem/master/ps_mem.py > /usr/local/bin/ps-mem \
 && chmod u+x /usr/local/bin/ps-mem

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y htop \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
