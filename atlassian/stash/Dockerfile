FROM helder/atlassian
MAINTAINER Helder Correia <me@heldercorreia.com>

# Install Stash
ENV STASH_VERSION 3.1.3
RUN /usr/sbin/useradd --create-home --home-dir /opt/stash --groups atlassian --shell /bin/bash stash
RUN curl -Lks http://www.atlassian.com/software/stash/downloads/binary/atlassian-stash-${STASH_VERSION}.tar.gz -o /root/stash.tar.gz \
 && tar zxf /root/stash.tar.gz --strip=1 -C /opt/stash \
 && rm /root/stash.tar.gz
RUN sed -i -e "s/^#!\/bin\/sh/#!\/bin\/bash/" /opt/stash/bin/catalina.sh
RUN cp /opt/stash/conf/server.xml /opt/stash/conf/server-backup.xml
RUN chown -R stash:stash /opt/stash

ENV CONTEXT_PATH ROOT
ADD launch.bash /launch

# Launching Stash
WORKDIR /opt/stash
VOLUME /opt/atlassian-home
EXPOSE 7990 7999
USER stash
CMD ["/launch"]
