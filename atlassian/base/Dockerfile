FROM java:7-jre
MAINTAINER Helder Correia <me@heldercorreia.com>

# Install dependencies
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -q -y git-core curl sudo xmlstarlet \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Setup volume handling
RUN /usr/sbin/groupadd atlassian
ADD own-volume.sh /usr/local/bin/own-volume
RUN echo "%atlassian ALL=NOPASSWD: /usr/local/bin/own-volume" >> /etc/sudoers
RUN mkdir -p /opt/atlassian-home

# Add common script functions
ADD common.bash /usr/local/share/atlassian/common.bash
RUN chgrp atlassian /usr/local/share/atlassian/common.bash \
 && chmod g+w /usr/local/share/atlassian/common.bash
