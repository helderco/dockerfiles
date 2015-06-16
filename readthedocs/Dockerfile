FROM python:2.7

RUN pip install \
        dj_database_url==0.3.0 \
        django-getenv==1.3.1 \
        sentry-jira==0.8.0 \
        sentry==6.4.4 \
        psycopg2

RUN mkdir /app
COPY . /app
WORKDIR /app

EXPOSE 9000
ENTRYPOINT ["sentry", "--config=/app/sentry.conf.py"]
CMD ["start"]
