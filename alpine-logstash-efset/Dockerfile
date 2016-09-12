FROM alpine:3.4

ENV LOGSTASH_VERSION=2.4.0
ENV LOGSTASH_DATA=/var/services/data/logstash/
ENV LOGSTASH_LOG=/var/services/log/
ENV LOGSTASH_LOG_LEVEL=INFO
ENV LOGSTASH_URL=https://download.elastic.co/logstash/logstash/logstash-$LOGSTASH_VERSION.tar.gz
ENV GEO_LITE_CITY_DAT="http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz"

# Install
RUN apk add --update --no-cache bash curl ca-certificates openjdk8-jre-base && \
curl -L -O https://download.elastic.co/logstash/logstash/logstash-$LOGSTASH_VERSION.tar.gz && \
tar -xzf logstash-$LOGSTASH_VERSION.tar.gz && \
rm logstash-$LOGSTASH_VERSION.tar.gz && \
mv /logstash-$LOGSTASH_VERSION /logstash && \
rm $(find /logstash | egrep "\.(exe|bat|txt|textile)")

RUN mkdir -p /etc/geoip/ && \
curl -sSL "$GEO_LITE_CITY_DAT" | gunzip > /etc/geoip/GeoLiteCity.dat

# Install plugins
RUN /logstash/bin/logstash-plugin install logstash-input-beats \
logstash-input-http logstash-filter-grok logstash-filter-json \
logstash-filter-geoip logstash-filter-mutate logstash-output-elasticsearch

# Prepare
RUN chmod 775 /logstash && chmod 775 /logstash/*
RUN mkdir -p $LOGSTASH_DATA $LOGSTASH_LOG

# Copy
COPY *.conf /logstash/config/
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Filebeat port
EXPOSE 5044

# HTTP port
EXPOSE 31311

# Healthcheck - Docker 1.12
HEALTHCHECK --interval=5s --timeout=3s --retries=10 CMD \
curl "$(hostname):31311" || exit 1

ENTRYPOINT ["docker-entrypoint.sh"]
CMD []
