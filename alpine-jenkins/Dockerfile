FROM quay.io/vnadgir_ef/alpine-javabase

# Inspired by https://github.com/cgswong/docker-jenkins

# Install linux libs
RUN apk update && apk upgrade && \
apk add curl jq make git sudo && \
rm -rfv /var/cache/apk/* /tmp/* /var/tmp/*

ENV JENKINS_VERSION=1.656
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
COPY plugins.txt $JENKINS_INSTALL_DIR
RUN for plugin in `cat $JENKINS_INSTALL_DIR/plugins.txt`; do \
  echo "https://updates.jenkins-ci.org/latest/${plugin}.hpi" ;\
  curl -SL https://updates.jenkins-ci.org/latest/${plugin}.hpi --output $JENKINS_PLUGINS/${plugin}.hpi; \
  done;

RUN sudo chown -R jenkins:jenkins ${JENKINS_INSTALL_DIR}

RUN ln -s ${JENKINS_PLUGINS} ${JENKINS_HOME}

# Docker stuff
RUN echo "jenkins ALL=NOPASSWD: /bin/docker.io" >> /etc/sudoers
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
