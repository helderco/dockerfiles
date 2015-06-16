FROM helder/atlassian
MAINTAINER Helder Correia <me@heldercorreia.com>

# Install Jira
ENV JIRA_VERSION 6.3.7
RUN /usr/sbin/useradd --create-home --home-dir /opt/jira --groups atlassian --shell /bin/bash jira
RUN curl -Lks http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-${JIRA_VERSION}.tar.gz -o /root/jira.tar.gz \
 && tar zxf /root/jira.tar.gz --strip=1 -C /opt/jira \
 && rm /root/jira.tar.gz
RUN chown -R jira:jira /opt/atlassian-home
RUN echo "jira.home = /opt/atlassian-home" > /opt/jira/atlassian-jira/WEB-INF/classes/jira-application.properties
RUN cp /opt/jira/conf/server.xml /opt/jira/conf/server-backup.xml
RUN chown -R jira:jira /opt/jira

ENV CONTEXT_PATH ROOT
ADD launch.bash /launch

# Launching Jira
WORKDIR /opt/jira
VOLUME ["/opt/atlassian-home"]
EXPOSE 8080
USER jira
CMD ["/launch"]
