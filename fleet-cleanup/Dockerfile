FROM alpine:3.3

RUN apk add --no-cache --upgrade bash diffutils curl docker jq

COPY docker-entrypoint.sh /usr/local/bin/.

ENTRYPOINT ["docker-entrypoint.sh"]
CMD [""]
