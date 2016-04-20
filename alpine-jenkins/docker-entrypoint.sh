#!/bin/bash

set -eo pipefail

# If there are any arguments then we want to run those instead
if [[ "$1" == "-"* || -z $1 ]]; then
  exec java -jar /opt/jenkins/jenkins.war "$@"
else
  exec "$@"
fi
