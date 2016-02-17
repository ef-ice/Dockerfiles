FROM oberthur/docker-alpine-java

ENV SOLR_VERSION=5.4.1

# RUN apk update && apk upgrade
RUN apk add curl

RUN curl -LO http://mirror.ox.ac.uk/sites/rsync.apache.org/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz
RUN tar xzf solr-$SOLR_VERSION.tgz
RUN rm solr-$SOLR_VERSION.tgz
RUN mv /solr-$SOLR_VERSION /opt/solr
RUN apk del curl && rm -rfv /var/cache/apk/* /tmp/* /var/tmp/*

ADD solr /opt/solr/server/solr

EXPOSE 8983

CMD ["/opt/solr/bin/solr", "-f"]
