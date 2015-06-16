#!/bin/sh

nrsysmond-config --set \
    license_key=${LICENSE_KEY:-YOUR_LICENSE_KEY} \
    loglevel=${LOG_LEVEL:-info} \
    logfile=${LOG_FILE:-/dev/stdout}

exec "$@"
