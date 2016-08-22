FROM nginx:stable
ENV GEO_IP_DAT="http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz"
ENV GEO_LITE_CITY_DAT="http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz"
COPY nginx/mime.types /etc/nginx/conf/mime.types
COPY nginx/nginx.conf /etc/nginx/conf/nginx.conf

RUN apt-get update && \
  apt-get install -y curl nodejs git jq python npm nodejs-legacy && \
  mkdir -p /etc/nginx/conf /etc/nginx/logs /etc/geoip/ && \
  curl -SL "$GEO_IP_DAT" | gunzip > /etc/geoip/GeoIP.dat && \
  curl -SL "$GEO_LITE_CITY_DAT" | gunzip > /etc/geoip/GeoLiteCity.dat && \
  npm install -g bower grunt-cli
