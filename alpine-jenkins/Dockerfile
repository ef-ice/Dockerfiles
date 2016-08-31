FROM quay.io/vnadgir_ef/alpine-java

# Install linux libs
RUN apk add --update --no-cache jq make git sudo openssh nodejs bash

ENV M2_HOME=/usr/lib/mvn M2=/usr/lib/mvn/bin PATH=$PATH:/usr/lib/mvn:/usr/lib/mvn/bin MAVEN_VERSION=3.3.9

# Install
RUN curl -L -O http://ftp.fau.de/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
mv apache-maven-$MAVEN_VERSION /usr/lib/mvn

ENV JENKINS_VERSION=1.651.3
ENV JENKINS_USER jenkins
ENV JENKINS_GROUP jenkins
ENV JENKINS_INSTALL_DIR /opt/install/jenkins
ENV JENKINS_HOME /opt/jenkins
ENV JENKINS_WAR ${JENKINS_INSTALL_DIR}/jenkins.war
ENV JENKINS_PLUGINS ${JENKINS_INSTALL_DIR}/plugins

# Install jenkins
RUN mkdir -p $JENKINS_INSTALL_DIR && mkdir -p $JENKINS_PLUGINS

RUN mkdir -p $JENKINS_HOME && \
curl -SL https://updates.jenkins-ci.org/download/war/$JENKINS_VERSION/jenkins.war --output ${JENKINS_WAR}

# Setup jenkins user
RUN addgroup ${JENKINS_GROUP} && \
adduser -h ${JENKINS_HOME} -D -s /bin/bash -G ${JENKINS_GROUP} ${JENKINS_USER} && \
chown -R ${JENKINS_USER}:${JENKINS_GROUP} ${JENKINS_HOME} && \
chown -R ${JENKINS_USER}:${JENKINS_GROUP} ${JENKINS_WAR} && \
chown -R ${JENKINS_USER}:${JENKINS_GROUP} ${JENKINS_INSTALL_DIR} && \
chown ${JENKINS_USER}:${JENKINS_GROUP} /lib/lib* && \
chown ${JENKINS_USER}:${JENKINS_GROUP} /usr/lib/lib*

# Install jenkins plugins
ENV JENKINS_UC=https://updates.jenkins.io
COPY plugins.txt $JENKINS_INSTALL_DIR
COPY install-plugins.sh /usr/local/bin/install-plugins.sh
RUN /usr/local/bin/install-plugins.sh $JENKINS_INSTALL_DIR/plugins.txt


# Docker stuff
RUN echo "jenkins ALL=NOPASSWD: /usr/bin/docker" >> /etc/sudoers
COPY docker.sh /usr/bin/docker
RUN chmod +x /usr/bin/docker


# For web UI
EXPOSE 8080

# For slave agents
EXPOSE 50000

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

USER ${JENKINS_USER}

# TODO VOLUME ["/opt/jenkins"]

ENTRYPOINT ["docker-entrypoint.sh"]
CMD [""]
