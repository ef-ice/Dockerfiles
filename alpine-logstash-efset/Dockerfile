FROM oberthur/docker-alpine-java

ENV LOGSTASH_VERSION=2.3.2
ENV LOGSTASH_DATA=/var/services/data/logstash/
ENV LOGSTASH_LOG=/var/services/log/
ENV LOGSTASH_LOG_LEVEL=INFO
ENV LOGSTASH_URL=https://download.elastic.co/logstash/logstash/logstash-$LOGSTASH_VERSION.tar.gz
ENV GEO_IP_DAT="http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz"
ENV GEO_LITE_CITY_DAT="http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz"

WORKDIR /opt

# Install
RUN apk update && apk upgrade && \
apk add --update curl bash && \
curl -L -O https://download.elastic.co/logstash/logstash/logstash-$LOGSTASH_VERSION.tar.gz && \
tar xzf logstash-$LOGSTASH_VERSION.tar.gz && \
rm logstash-$LOGSTASH_VERSION.tar.gz && \
mv logstash-$LOGSTASH_VERSION logstash && \
rm $(find /opt/logstash | egrep "\.(exe|bat)") && \
mkdir -p /etc/geoip/ && \
curl -sSL "$GEO_IP_DAT" | gunzip > /etc/geoip/GeoIP.dat && \
curl -sSL "$GEO_LITE_CITY_DAT" | gunzip > /etc/geoip/GeoLiteCity.dat && \
apk del curl && rm -rfv /var/cache/apk/* /tmp/* /var/tmp/*

# Install plugins
RUN /opt/logstash/bin/logstash-plugin install logstash-input-beats logstash-input-http
RUN /opt/logstash/bin/logstash-plugin install logstash-filter-grok logstash-filter-json logstash-filter-geoip logstash-filter-mutate
RUN /opt/logstash/bin/logstash-plugin install logstash-output-elasticsearch

# Prepare
RUN chmod 775 /opt/logstash && chmod 775 /opt/logstash/*
RUN mkdir -p $LOGSTASH_DATA
RUN mkdir -p $LOGSTASH_LOG

# Copy
COPY *.conf /opt/logstash/config/
COPY docker-entrypoint.sh /opt/docker-entrypoint.sh

# Filebeat port
EXPOSE 5044

# HTTP port
EXPOSE 31311

ENTRYPOINT ["/opt/docker-entrypoint.sh"]
CMD []
