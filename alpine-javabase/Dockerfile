FROM oberthur/docker-alpine-java

RUN apk add --update git wget

RUN wget http://ftp.fau.de/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
RUN tar -zxvf apache-maven-3.3.9-bin.tar.gz
RUN rm apache-maven-3.3.9-bin.tar.gz
RUN mv apache-maven-3.3.9 /usr/lib/mvn

RUN apk del wget && \
	rm /var/cache/apk/*

ENV M2_HOME=/usr/lib/mvn
ENV M2=$M2_HOME/bin
ENV PATH $PATH:$M2_HOME:$M2
