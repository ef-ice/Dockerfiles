FROM debian:jessie

ENV FILEBEAT_VERSION=1.2.2

WORKDIR /opt

RUN apt-get update && apt-get upgrade && apt-get install -y curl && \
curl -LO https://download.elastic.co/beats/filebeat/filebeat-$FILEBEAT_VERSION-x86_64.tar.gz && \
tar xzf filebeat-$FILEBEAT_VERSION-x86_64.tar.gz && \
rm filebeat-$FILEBEAT_VERSION-x86_64.tar.gz && \
mv filebeat-$FILEBEAT_VERSION-x86_64 filebeat && \
apt-get purge -y curl && \
apt-get autoremove -y && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt/filebeat

COPY filebeat.conf ./
COPY docker-entrypoint.sh /usr/local/bin/.

ENTRYPOINT ["docker-entrypoint.sh"]
CMD []
