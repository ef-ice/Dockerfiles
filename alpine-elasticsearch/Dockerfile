FROM oberthur/docker-alpine-java

ENV ES_VERSION 2.2.0

RUN apk add --update curl
RUN curl -L -O https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/$ES_VERSION/elasticsearch-$ES_VERSION.tar.gz
RUN tar -zxvf elasticsearch-$ES_VERSION.tar.gz
RUN mv /elasticsearch-$ES_VERSION /elasticsearch
RUN rm $(find /elasticsearch | egrep "\.(exe|bat)")
RUN apk del curl && rm -rfv /var/cache/apk/* /tmp/* /var/tmp/*

ADD elasticsearch.yml /elasticsearch/config/
ADD entrypoint.sh /entrypoint.sh

RUN chmod 775 /elasticsearch && chmod 775 /elasticsearch/*
RUN mkdir -p /var/services && chmod 775 /var/services

USER 1000
ENTRYPOINT ["/entrypoint.sh"]
CMD ["elasticsearch"]

EXPOSE 9200 9300
