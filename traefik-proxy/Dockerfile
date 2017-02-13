FROM traefik:v1.2.0-rc1-alpine

RUN apk add --update-cache --no-cache bash
EXPOSE 8080

WORKDIR /opt/traefik

COPY traefik.toml /opt/traefik/traefik.toml
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD [""]
