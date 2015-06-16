#!/bin/bash
set -o errexit

. /usr/local/share/atlassian/common.bash

sudo own-volume
umask 0027

if [ -z "$STASH_HOME" ]; then
  export STASH_HOME=/opt/atlassian-home
fi

if [ "$CONTEXT_PATH" == "ROOT" -o -z "$CONTEXT_PATH" ]; then
  CONTEXT_PATH=
else
  echo "Setting context path to: $CONTEXT_PATH"
  CONTEXT_PATH="/$CONTEXT_PATH"
fi
xmlstarlet ed -u '//Context/@path' -v "$CONTEXT_PATH" conf/server-backup.xml > conf/server.xml

if [ ! -z "$SSL_PROXY" ]; then
    echo "Setting secure reverse proxy to: https://$SSL_PROXY"
    cp conf/server.xml conf/server.xml~
    xmlstarlet ed -i '//Connector' -t attr -n secure -v true \
                  -i '//Connector' -t attr -n scheme -v https \
                  -i '//Connector' -t attr -n proxyName -v $SSL_PROXY \
                  -i '//Connector' -t attr -n proxyPort -v 443 \
                  conf/server.xml~ > conf/server.xml
    rm conf/server.xml~
fi

if [ -n "$DATABASE_URL" ]; then
  extract_database_url "$DATABASE_URL" DB /opt/stash/lib
  cat << EOF > /opt/atlassian-home/stash-config.properties
#>*******************************************************
#> Migrated to database at $DB_JDBC_URL
#> Generated by launch script on `date`
#>*******************************************************
jdbc.driver=$DB_JDBC_DRIVER
jdbc.url=$DB_JDBC_URL
jdbc.user=$DB_USER
jdbc.password=$DB_PASSWORD
EOF

fi

exec /opt/stash/bin/start-stash.sh -fg
