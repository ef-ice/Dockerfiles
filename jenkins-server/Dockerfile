FROM axltxl/jenkins-dood

# Install linux libs
RUN apt-get update \
&& apt-get install -y curl jq make \
&& rm -rf /var/lib/apt/lists/*

ENV MAVEN_VERSION=3.3.9

# Install maven for jenkins user
RUN curl -L -O http://ftp.fau.de/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
&& tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz \
&& rm apache-maven-$MAVEN_VERSION-bin.tar.gz \
&& mv apache-maven-$MAVEN_VERSION /usr/lib/mvn \
&& chown -R jenkins:jenkins /usr/lib/mvn

# Configure mvn for jenkins user
USER jenkins
ENV M2_HOME=/usr/lib/mvn M2=/usr/lib/mvn/bin PATH=$PATH:/usr/lib/mvn:/usr/lib/mvn/bin

USER root
