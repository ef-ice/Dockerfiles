FROM alpine:3.5

RUN apk add --no-cache --upgrade bash python-dev gcc \
build-base curl util-linux openjdk8-jre-base

WORKDIR /opt

RUN curl -SL https://bootstrap.pypa.io/get-pip.py | python && \
pip install --upgrade --no-cache-dir boto awscli

COPY cassandra-s3-backup.sh /usr/local/bin/cassandra-s3-backup.sh

VOLUME /var/lib/cassandra

ENTRYPOINT ["cassandra-s3-backup.sh"]
CMD [""]
