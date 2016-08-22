FROM nginx:stable

RUN apt-get update && apt-get install -y curl nodejs git jq python npm

RUN mkdir -p /etc/nginx/conf
RUN mkdir -p /etc/nginx/logs
RUN mkdir -p /etc/geoip/

ENV GEO_IP_DAT="http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz"
RUN curl -SL "$GEO_IP_DAT" | gunzip > /etc/geoip/GeoIP.dat

ENV GEO_LITE_CITY_DAT="http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz"
RUN curl -SL "$GEO_LITE_CITY_DAT" | gunzip > /etc/geoip/GeoLiteCity.dat

COPY nginx/mime.types /etc/nginx/conf/mime.types
