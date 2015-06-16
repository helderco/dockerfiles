FROM debian:wheezy
MAINTAINER Helder Correia <me@heldercorreia.com>

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y curl \
 && rm -rf /var/lib/apt/lists/*

RUN echo "deb http://debian.saltstack.com/debian wheezy-saltstack main" > /etc/apt/sources.list.d/saltstack.list \
 && curl -sL "http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key" | apt-key add - \
 && apt-get update \
 && apt-get install -y python salt-master salt-cloud \
 && apt-get autoremove \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 4505 4506
VOLUME ['/etc/salt']
CMD ['/usr/bin/salt-master']
