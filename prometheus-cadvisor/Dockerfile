FROM prom/prometheus:latest

RUN mkdir -p /opt/prometheus

COPY config/ /etc/prometheus/
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD [""]
