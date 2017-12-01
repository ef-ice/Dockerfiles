#!/bin/bash
set -eo pipefail

if [ -z "$ELASTICSEARCH_NODES" ]; then
   echo "Missing ELASTICSEARCH_NODES, e.g. [\"172.24.40.1:9200\",\"172.24.40.2:9200\"]"
   exit 1
fi

sed -i "s~ELASTICSEARCH_NODES~$ELASTICSEARCH_NODES~g" /logstash/config/logstash.conf

cat /logstash/config/logstash.conf

# If there are any arguments then we want to run those instead
if [[ "$1" == "-"* || -z $1 ]]; then
  exec /logstash/bin/logstash agent -f /logstash/config/logstash.conf "$@" --debug
else
  exec "$@" --debug
fi
