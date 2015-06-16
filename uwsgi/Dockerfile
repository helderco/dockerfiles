FROM python:2.7
MAINTAINER Helder Correia <me@heldercorreia.com>

# install uwsgi
RUN pip install uwsgi uwsgitop
COPY uwsgi.ini /etc/

# run in /app
RUN mkdir -p /app
WORKDIR /app

# expose uwsgi socket and stats ports
EXPOSE 3000 9000

# run uwsgi
CMD ["uwsgi", "/etc/uwsgi.ini"]
