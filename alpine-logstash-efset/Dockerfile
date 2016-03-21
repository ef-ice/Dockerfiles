FROM oberthur/docker-alpine-java

ENV LOGSTASH_VERSION=1.5.3 LOGSTASH_PKG=logstash-1.5.3 LOGSTASH_DATA=/var/services/data/logstash/ LOGSTASH_LOG=/var/services/log/ LOGSTASH_LOG_LEVEL=INFO LOGSTASH_URL=https://download.elastic.co/logstash/logstash/logstash-1.5.3.tar.gz

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
ADD *.conf /opt/logstash-1.5.3/config/

EXPOSE 5000

CMD ["/opt/logstash-1.5.3/bin/logstash", "agent", "--debug", "-f", "/opt/logstash-1.5.3/config/akamai_logstash.conf"]
