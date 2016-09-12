FROM alpine:3.4

ENV ES_VERSION=2.4.0
ENV ELASTICSEARCH_DATA=/var/services/data/elasticsearch/
ENV ELASTICSEARCH_LOG=/var/services/log/

# Install the application
RUN apk add --update --no-cache curl ca-certificates openjdk8-jre-base && \
curl -L -O https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz && \
tar -xzf elasticsearch-$ES_VERSION.tar.gz && \
rm elasticsearch-$ES_VERSION.tar.gz && \
mv /elasticsearch-$ES_VERSION /elasticsearch && \
rm $(find /elasticsearch | egrep "\.(exe|bat|txt|textile)")

# Install plugins
RUN /elasticsearch/bin/plugin install license
RUN /elasticsearch/bin/plugin install marvel-agent
RUN /elasticsearch/bin/plugin install cloud-aws

# Copy files
COPY elasticsearch.yml /elasticsearch/config/

RUN adduser -D -H -g 1000 1000 && \
mkdir -p $ELASTICSEARCH_DATA $ELASTICSEARCH_LOG && \
chown -R 1000:1000 /elasticsearch $ELASTICSEARCH_DATA $ELASTICSEARCH_LOG

# Expose ports
EXPOSE 9200 9300

# Healthcheck - Docker 1.12
HEALTHCHECK --interval=5s --timeout=3s --retries=10 CMD \
curl "$(hostname):9200" || exit 1

# Change user - mandatory for ES
USER 1000

ENTRYPOINT ["/elasticsearch/bin/elasticsearch"]
CMD []
