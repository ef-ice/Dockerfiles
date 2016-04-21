FROM quay.io/vnadgir_ef/alpine-javabase

# Inspired by https://github.com/cgswong/docker-jenkins

# Install linux libs
RUN apk update && apk upgrade && \
apk add curl jq make git && \
rm -rfv /var/cache/apk/* /tmp/* /var/tmp/*

ENV JENKINS_VERSION=1.656
ENV JENKINS_USER jenkins
ENV JENKINS_GROUP jenkins
ENV JENKINS_HOME /opt/jenkins
ENV JENKINS_WAR /opt/jenkins.war
ENV JENKINS_PLUGINS $JENKINS_HOME/plugins

# Install jenkins
RUN mkdir -p $JENKINS_HOME $JENKINS_PLUGINS && \
curl -SL https://updates.jenkins-ci.org/download/war/$JENKINS_VERSION/jenkins.war --output ${JENKINS_WAR}

# Setup jenkins user
RUN addgroup ${JENKINS_GROUP} && \
adduser -h ${JENKINS_HOME} -D -s /bin/bash -G ${JENKINS_GROUP} ${JENKINS_USER} && \
chown -R ${JENKINS_USER}:${JENKINS_GROUP} ${JENKINS_HOME} && \
chown -R ${JENKINS_USER}:${JENKINS_GROUP} ${JENKINS_WAR}

# Install jenkins plugins
RUN for plugin in scm-sync-configuration scm-api git-client git greenballs; do \
curl -sSL https://updates.jenkins-ci.org/latest/${plugin}.hpi --output $JENKINS_PLUGINS/${plugin}.hpi; done

EXPOSE 8080 50000

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

USER ${JENKINS_USER}

ENTRYPOINT ["docker-entrypoint.sh"]
CMD [""]
