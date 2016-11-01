FROM debian:jessie

RUN apt-get update && apt-get install -y lzop python2.7-dev curl gcc && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN ln -s /usr/bin/python2.7 /usr/local/bin/python

RUN curl -SL https://bootstrap.pypa.io/get-pip.py | python && \
pip install --upgrade --no-cache-dir cassandra_snapshotter

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN mkdir -p /root/.ssh && touch /root/.ssh/config

ENTRYPOINT ["docker-entrypoint.sh"]
CMD []
