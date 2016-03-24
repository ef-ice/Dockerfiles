FROM oberthur/docker-alpine-java

ENV LOGSTASH_VERSION=1.5.3
ENV LOGSTASH_PKG=logstash-1.5.3
ENV LOGSTASH_DATA=/var/services/data/logstash/
ENV LOGSTASH_LOG=/var/services/log/
ENV LOGSTASH_LOG_LEVEL=INFO
ENV LOGSTASH_URL=https://download.elastic.co/logstash/logstash/logstash-1.5.3.tar.gz

# Install
RUN apk update && \
  apk upgrade && \
  apk add --update curl && \
  curl -o /tmp/$LOGSTASH_PKG.tar.gz $LOGSTASH_URL

RUN  tar xzf /tmp/$LOGSTASH_PKG.tar.gz -C /opt/ && \
  rm /tmp/$LOGSTASH_PKG.tar.gz && \
  rm $(find /opt/$LOGSTASH_PKG | egrep "\.(exe|bat)") && \
  apk del curl && rm -rfv /var/cache/apk/* /tmp/* /var/tmp/* && \
  chmod 775 /opt/logstash-1.5.3 && chmod 775 /opt/logstash-1.5.3/* && \
  mkdir -p $LOGSTASH_DATA && \
  mkdir -p $LOGSTASH_LOG

# Copy
COPY *.conf /opt/logstash-1.5.3/config/
COPY docker-cmd.sh /opt/docker-cmd.sh

EXPOSE 5000

ENTRYPOINT ["/opt/docker-cmd.sh"]
