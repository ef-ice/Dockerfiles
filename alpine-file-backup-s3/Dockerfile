FROM alpine:3.4

RUN mkdir -p /aws && \
	apk -Uuv add python py-pip && \
	pip install awscli && \
	apk --purge -v del py-pip && \
	rm /var/cache/apk/*
COPY backup.sh /backup.sh
COPY restore.sh /restore.sh


