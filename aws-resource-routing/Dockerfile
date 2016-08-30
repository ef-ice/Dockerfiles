FROM alpine:3.4

RUN apk add --update --no-cache curl python jq bash

WORKDIR /opt

RUN curl -L -O https://bootstrap.pypa.io/get-pip.py && \
python get-pip.py && rm get-pip.py && \
pip install -U boto awscli

COPY docker-entrypoint.sh /usr/local/bin/.
COPY resource-changes.json .

ENTRYPOINT ["docker-entrypoint.sh"]
CMD []
