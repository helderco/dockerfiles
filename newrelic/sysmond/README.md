# New Relic Servers monitoring

Docker container for running the New Relic monitoring daemon for servers.

[https://docs.newrelic.com/docs/servers/new-relic-servers-linux/getting-started/new-relic-servers-linux]()

**Note:** Even though this will report uptime, as of now it won't give you accurate host statistics
because there isn't yet a way to use a custom `/proc` location to bind-mount host data. Without it,
this daemon will only report usage from within this container, which is not very useful. Let's hope
New Relic fixes this soon.

## Usage

Just set your license key using an environment variable and don't forget the hostname that
you would like to show in your New Relic dashboard.

    docker run -d -e LICENSE_KEY=<your-license> -h `hostname` helder/newrelic-sysmond

You can also use the following environment variables:

* `LOG_LEVEL` (default: info)
* `LOG_FILE` (default: /dev/stdout)

### Unit for CoreOS

If you're using CoreOS add a systemd unit:

    # newrelic-sysmond.service

    [Unit]
    Description=New Relic Server monitoring
    After=docker.service
    Requires=docker.service

    [Service]
    Restart=always
    TimeoutStartSec=0
    ExecStartPre=/usr/bin/docker pull helder/newrelic-sysmond
    ExecStartPre=-/usr/bin/docker kill newrelic-sysmond
    ExecStartPre=-/usr/bin/docker rm -v newrelic-sysmond
    ExecStart=/usr/bin/docker run -e LICENSE_KEY=<your-license> -h %H --name newrelic-sysmond helder/newrelic-sysmond
    ExecStop=/usr/bin/docker stop newrelic-sysmond

    [X-Fleet]
    Global=true

And run it with fleet:

    fleetctl start newrelic-sysmond.service
