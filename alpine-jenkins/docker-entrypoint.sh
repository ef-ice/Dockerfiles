#!/bin/bash

set -eo pipefail


ln -s  ${JENKINS_INSTALL_DIR}/plugins ${JENKINS_HOME}/plugins


# If there are any arguments then we want to run those instead
if [[ "$1" == "-"* || -z $1 ]]; then
  exec java -jar ${JENKINS_INSTALL_DIR}/jenkins.war "$@"
else
  exec "$@"
fi
