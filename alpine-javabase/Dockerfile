FROM oberthur/docker-alpine-java

ENV M2_HOME=/usr/lib/mvn M2=/usr/lib/mvn/bin PATH=$PATH:/usr/lib/mvn:/usr/lib/mvn/bin MAVEN_VERSION=3.3.9

# Install
RUN apk update && \
  apk upgrade && \
  apk add curl && \
  curl -L -O http://ftp.fau.de/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  mv apache-maven-$MAVEN_VERSION /usr/lib/mvn && \
  apk del curl && rm -rfv /var/cache/apk/* /tmp/* /var/tmp/*

