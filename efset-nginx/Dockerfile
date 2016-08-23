FROM nginx:stable
ENV GEO_IP_DAT="http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz"
ENV GEO_LITE_CITY_DAT="http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz"
COPY nginx/mime.types /etc/nginx/conf/mime.types
COPY nginx/nginx.conf /etc/nginx/conf/nginx.conf
COPY bin/install_node_dependencies.sh /usr/local/bin/install_node_dependencies.sh
ENV NODE_VERSION=v4.5.0
WORKDIR /var/www

RUN apt-get update && \
  apt-get install -y curl git jq python && \
  mkdir -p /etc/nginx/conf /etc/nginx/logs /etc/geoip/ && \
  curl -sSL "$GEO_IP_DAT" | gunzip > /etc/geoip/GeoIP.dat && \
  curl -sSL "$GEO_LITE_CITY_DAT" | gunzip > /etc/geoip/GeoLiteCity.dat && \
  curl -sSL https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.gz -o node-$NODE_VERSION-linux-x64.tar.gz && \
  tar -xvf node-$NODE_VERSION-linux-x64.tar.gz && \
  cp -rp node-$NODE_VERSION-linux-x64 /usr/local/ && \
  ln -s /usr/local/node-$NODE_VERSION-linux-x64 /usr/local/node

ENV PATH /usr/local/node/bin:$PATH
RUN npm install -g bower grunt-cli
ONBUILD COPY package.json /var/www/package.json
ONBUILD RUN jq -r '.devDependencies | to_entries[] | .key + "@" + .value' < package.json | xargs npm install
ONBUILD RUN jq -r '.dependencies | to_entries[] | .key + "@" + .value' < package.json | xargs npm install 
