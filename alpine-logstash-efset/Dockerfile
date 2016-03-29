FROM oberthur/docker-alpine-java

ENV LOGSTASH_VERSION=1.5.3
ENV LOGSTASH_DATA=/var/services/data/logstash/
ENV LOGSTASH_LOG=/var/services/log/
ENV LOGSTASH_LOG_LEVEL=INFO
ENV LOGSTASH_URL=https://download.elastic.co/logstash/logstash/logstash-$LOGSTASH_VERSION.tar.gz

WORKDIR /opt

# Install
RUN apk update && \
apk upgrade && \
apk add --update curl && \
curl -L -O https://download.elastic.co/logstash/logstash/logstash-$LOGSTASH_VERSION.tar.gz && \
tar xzf logstash-$LOGSTASH_VERSION.tar.gz && \
rm logstash-$LOGSTASH_VERSION.tar.gz && \
mv logstash-$LOGSTASH_VERSION logstash && \
rm $(find /opt/logstash | egrep "\.(exe|bat)") && \
apk del curl && rm -rfv /var/cache/apk/* /tmp/* /var/tmp/* && \
chmod 775 /opt/logstash && chmod 775 /opt/logstash/* && \
mkdir -p $LOGSTASH_DATA && \
mkdir -p $LOGSTASH_LOG

# Copy
COPY *.conf /opt/logstash/config/
COPY docker-cmd.sh /opt/docker-cmd.sh

EXPOSE 5000

CMD ["/opt/docker-cmd.sh"]
