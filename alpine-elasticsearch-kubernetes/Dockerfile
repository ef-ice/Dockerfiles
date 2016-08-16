FROM quay.io/vnadgir_ef/alpine-java

ENV APP_VERSION=2.3.4

# Install
RUN apk add --update --no-cache curl && \
curl -L -O https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-$APP_VERSION.tar.gz && \
tar xzf elasticsearch-$APP_VERSION.tar.gz && \
rm elasticsearch-$APP_VERSION.tar.gz && \
mv /elasticsearch-$APP_VERSION /elasticsearch && \
rm $(find /elasticsearch | egrep "\.(exe|bat|txt|textile)")

# Copy files
COPY elasticsearch.yml /elasticsearch/config/

# Install plugins
RUN /elasticsearch/bin/plugin install license
RUN /elasticsearch/bin/plugin install marvel-agent
RUN /elasticsearch/bin/plugin install io.fabric8/elasticsearch-cloud-kubernetes/$APP_VERSION

ENV ELASTICSEARCH_DATA=/var/services/data/elasticsearch
ENV ELASTICSEARCH_LOG=/var/services/log/elasticsearch

RUN mkdir -p $ELASTICSEARCH_DATA
RUN mkdir -p $ELASTICSEARCH_LOG
RUN adduser -D -H -g 1000 1000
RUN chown -R 1000:1000 /elasticsearch $ELASTICSEARCH_DATA $ELASTICSEARCH_LOG

# Expose ports
EXPOSE 9200 9300

# Change user - mandatory for ES
USER 1000

ENTRYPOINT ["/elasticsearch/bin/elasticsearch"]
