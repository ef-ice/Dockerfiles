#!/bin/bash

set -eo pipefail

ln -sf ${JENKINS_PLUGINS} ${JENKINS_HOME}

# If there are any arguments then we want to run those instead
if [[ "$1" == "-"* || -z $1 ]]; then
  exec java -jar ${JENKINS_INSTALL_DIR}/jenkins.war "$@"
else
  exec "$@"
fi
