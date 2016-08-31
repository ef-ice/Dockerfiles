FROM quay.io/vnadgir_ef/alpine-javabase

# Inspired by https://github.com/cgswong/docker-jenkins

# Install linux libs
RUN apk update && apk upgrade && \
apk add curl jq make git sudo openssh nodejs && \
rm -rfv /var/cache/apk/* /tmp/* /var/tmp/*

ENV JENKINS_VERSION=2.7.2
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
chown -R ${JENKINS_USER}:${JENKINS_GROUP} ${JENKINS_WAR}

# Install jenkins plugins
ENV JENKINS_UC=https://updates.jenkins.io
COPY plugins.txt $JENKINS_INSTALL_DIR
COPY install-plugins.sh /usr/local/bin/install-plugins.sh
RUN /usr/local/bin/install-plugins.sh $JENKINS_INSTALL_DIR/plugins.txt

RUN sudo chown -R jenkins:jenkins ${JENKINS_INSTALL_DIR}

# Docker stuff
RUN echo "jenkins ALL=NOPASSWD: /bin/docker.io" >> /etc/sudoers
COPY docker.sh /usr/bin/docker
RUN chmod +x /usr/bin/docker

# get ca cert
RUN curl https://curl.haxx.se/ca/cacert.pem > /etc/ssl/certs/cacert.pem
# alias for curl
RUN echo 'alias curl="curl --cacert /etc/ssl/certs/cacert.pem"' >> /opt/jenkins/.bashrc
RUN source /opt/jenkins/.bashrc


# For web UI
EXPOSE 8080

# For slave agents
EXPOSE 50000

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

USER ${JENKINS_USER}

# TODO VOLUME ["/opt/jenkins"]

ENTRYPOINT ["docker-entrypoint.sh"]
CMD [""]
