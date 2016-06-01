FROM oberthur/docker-alpine-java

ENV ES_VERSION=2.3.3
ENV ELASTICSEARCH_DATA=/var/services/data/elasticsearch/
ENV ELASTICSEARCH_LOG=/var/services/log/

# Install
RUN apk update && \
  apk upgrade && \
  apk add --update curl && \
  curl -L -O https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz && \
  tar xzf elasticsearch-$ES_VERSION.tar.gz && \
  rm elasticsearch-$ES_VERSION.tar.gz && \
  mv /elasticsearch-$ES_VERSION /elasticsearch && \
  rm $(find /elasticsearch | egrep "\.(exe|bat|txt|textile)") && \
  apk del curl && rm -rfv /var/cache/apk/* /tmp/* /var/tmp/*

# Copy files
COPY elasticsearch.yml /elasticsearch/config/

# Install plugins
RUN /elasticsearch/bin/plugin install cloud-aws
RUN /elasticsearch/bin/plugin install license
RUN /elasticsearch/bin/plugin install marvel-agent

RUN mkdir -p $ELASTICSEARCH_DATA
RUN mkdir -p $ELASTICSEARCH_LOG
RUN adduser -D -H -g 1000 1000
RUN chown -R 1000:1000 /elasticsearch $ELASTICSEARCH_DATA $ELASTICSEARCH_LOG

# Expose ports
EXPOSE 9200 9300

# Change user - mandatory for ES
USER 1000

ENTRYPOINT ["/elasticsearch/bin/elasticsearch"]
