FROM alpine:latest

RUN apk update && apk upgrade && \
apk add --update curl python && \
rm -rfv /var/cache/apk/* /tmp/* /var/tmp/*

WORKDIR /opt

RUN curl -L -O https://bootstrap.pypa.io/get-pip.py && \
python get-pip.py && rm get-pip.py && \
pip install -U boto awscli

COPY docker-entrypoint.sh .
COPY resource-changes.json .

ENTRYPOINT ["/opt/docker-entrypoint.sh"]
CMD []
