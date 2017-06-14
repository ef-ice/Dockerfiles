FROM nginx:stable
COPY nginx/mime.types /etc/nginx/conf/mime.types
COPY nginx/nginx.conf /etc/nginx/conf/nginx.conf
ENV NODE_VERSION=v7.7.4
WORKDIR /var/www

RUN apt-get update && \
  apt-get install -y curl git jq python && \
  mkdir -p /etc/nginx/conf /etc/nginx/logs && \
  curl -sSL https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.gz -o node-$NODE_VERSION-linux-x64.tar.gz && \
  tar -xvf node-$NODE_VERSION-linux-x64.tar.gz && \
  cp -rp node-$NODE_VERSION-linux-x64 /usr/local/ && \
  ln -s /usr/local/node-$NODE_VERSION-linux-x64 /usr/local/node

ENV PATH /usr/local/node/bin:$PATH

#Optimisation for avoiding the repeated running of npm and bower install
COPY dependencies/package.json /var/www/package.json
COPY bin/install_node_dependencies.sh /usr/local/bin/install_node_dependencies.sh
#RUN chmod 755 /usr/local/bin/install_node_dependencies.sh && /bin/sh -c "/usr/local/bin/install_node_dependencies.sh"
RUN npm install

#running npm and bower install on the actual dependency manifests to update the node modules
ONBUILD COPY package.json /var/www/package.json
ONBUILD RUN npm install
