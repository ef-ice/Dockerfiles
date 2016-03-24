FROM oberthur/docker-alpine-java

ENV ES_VERSION=1.7.3
ENV ELASTICSEARCH_DATA=/var/services/data/elasticsearch/
ENV ELASTICSEARCH_LOG=/var/services/log/
ENV ELASTICSEARCH_LOG_LEVEL=INFO

# Install
RUN apk update && \
  apk upgrade && \
  apk add --update curl && \
  curl -L -O https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz && \
  tar xzf elasticsearch-$ES_VERSION.tar.gz && \
  rm elasticsearch-$ES_VERSION.tar.gz && \
  mv /elasticsearch-$ES_VERSION /elasticsearch && \
  rm $(find /elasticsearch | egrep "\.(exe|bat)") && \
  apk del curl && rm -rfv /var/cache/apk/* /tmp/* /var/tmp/* && \
  chmod 775 /elasticsearch && chmod 775 /elasticsearch/* && \
  mkdir -p /var/services && chmod 775 /var/services && \
  mkdir -p $ELASTICSEARCH_DATA && \
  mkdir -p $ELASTICSEARCH_LOG && \
  chown -R 1000 /elasticsearch $ELASTICSEARCH_DATA $ELASTICSEARCH_LOG

# Copy
COPY elasticsearch.yml /elasticsearch/config/

EXPOSE 9200 9300

USER 1000

ENTRYPOINT ["/elasticsearch/bin/elasticsearch", "-Des.logger.level=$ELASTICSEARCH_LOG_LEVEL"]
