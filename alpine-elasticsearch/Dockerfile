FROM oberthur/docker-alpine-java

ENV ES_VERSION 2.2.0

# Install
RUN apk update && apk upgrade
RUN apk add --update curl
RUN curl -L -O https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/$ES_VERSION/elasticsearch-$ES_VERSION.tar.gz
RUN tar -zxvf elasticsearch-$ES_VERSION.tar.gz && rm elasticsearch-$ES_VERSION.tar.gz
RUN mv /elasticsearch-$ES_VERSION /elasticsearch

# Clean up
RUN rm $(find /elasticsearch | egrep "\.(exe|bat)")
RUN apk del curl && rm -rfv /var/cache/apk/* /tmp/* /var/tmp/*

# Copy
ADD elasticsearch.yml /elasticsearch/config/

# Setup
RUN chmod 775 /elasticsearch && chmod 775 /elasticsearch/*
RUN mkdir -p /var/services && chmod 775 /var/services

# RUN
USER 1000
ENV ELASTICSEARCH_DATA /var/services/data/elasticsearch/
ENV ELASTICSEARCH_LOG /var/services/log/
ENV ELASTICSEARCH_LOG_LEVEL INFO

RUN mkdir -p $ELASTICSEARCH_DATA
RUN mkdir -p $ELASTICSEARCH_LOG
CMD "/elasticsearch/bin/elasticsearch" "-Des.logger.level=$ELASTICSEARCH_LOG_LEVEL"

EXPOSE 9200 9300
