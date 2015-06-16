FROM registry:0.9.0

RUN apt-get update && \
    apt-get install -y libpq-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install psycopg2

ENV SETTINGS_FLAVOR local
ENV SEARCH_BACKEND sqlalchemy
ENV GUNICORN_OPTS [--preload]
