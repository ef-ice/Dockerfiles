FROM nginx:stable
COPY nginx/mime.types /etc/nginx/conf/mime.types
COPY nginx/nginx.conf /etc/nginx/conf/nginx.conf
COPY bin/install_node_dependencies.sh /usr/local/bin/install_node_dependencies.sh
ENV NODE_VERSION=v4.5.0
WORKDIR /var/www

COPY nginx/GeoIP.dat /etc/geoip/GeoIP.dat
COPY nginx/GeoLiteCity.dat /etc/geoip/GeoLiteCity.dat

RUN apt-get update && \
  apt-get install -y curl git jq python && \
  mkdir -p /etc/nginx/conf /etc/nginx/logs && \
  curl -sSL https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.gz -o node-$NODE_VERSION-linux-x64.tar.gz && \
  tar -xvf node-$NODE_VERSION-linux-x64.tar.gz && \
  cp -rp node-$NODE_VERSION-linux-x64 /usr/local/ && \
  ln -s /usr/local/node-$NODE_VERSION-linux-x64 /usr/local/node

ENV PATH /usr/local/node/bin:$PATH
RUN npm install -g bower grunt-cli
#Optimisation for avoiding the repeated running of npm and bower install
COPY dependencies/package.json /var/www/package.json
COPY dependencies/bower.json /var/www/bower.json
RUN jq -r '.devDependencies | to_entries[] | .key + "@" + .value' < package.json | xargs npm install && \
  jq -r '.dependencies | to_entries[] | .key + "@" + .value' < package.json | xargs npm install && \
  bower install --allow-root --production

#running npm and bower install on the actual dependency manifests to update the node modules
ONBUILD COPY package.json /var/www/package.json
ONBUILD COPY bower.json /var/www/bower.json
ONBUILD RUN jq -r '.devDependencies | to_entries[] | .key + "@" + .value' < package.json | xargs npm install && \
  jq -r '.dependencies | to_entries[] | .key + "@" + .value' < package.json | xargs npm install && \
  bower install --allow-root --production
