FROM prom/alertmanager

COPY config/alertmanager.yml /etc/alertmanager/alertmanager.yml
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD []
