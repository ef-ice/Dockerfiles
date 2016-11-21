FROM alpine:3.4

RUN apk update && \
 mkdir -p /aws && \
	apk -Uuv add curl jq groff less python py-pip && \
	pip install awscli && \
	apk --purge -v del py-pip && \
	rm /var/cache/apk/*

COPY bin/backup.sh /usr/local/bin/backup.sh
