FROM oberthur/docker-alpine-java

ENV MAVEN_VERSION 3.3.9

# Install
RUN apk update && apk upgrade
RUN apk add --update curl
RUN curl -L -O http://ftp.fau.de/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    && tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz \
    && rm apache-maven-$MAVEN_VERSION-bin.tar.gz \
    && mv apache-maven-$MAVEN_VERSION /usr/lib/mvn

# Clean up
RUN apk del curl && rm -rfv /var/cache/apk/* /tmp/* /var/tmp/*

ENV M2_HOME=/usr/lib/mvn
ENV M2=$M2_HOME/bin
ENV PATH $PATH:$M2_HOME:$M2
