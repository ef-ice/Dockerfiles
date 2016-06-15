#!/bin/bash
set -eo pipefail

if [ -z "$ELASTICSEARCH_NODES" ]; then
   echo "Missing ELASTICSEARCH_NODES, e.g. [\"172.24.40.1:9200\",\"172.24.40.2:9200\"]"
   exit 1
fi

sed -i "s~ELASTICSEARCH_NODES~$ELASTICSEARCH_NODES~g" /opt/logstash/config/logstash.conf

cat /opt/logstash/config/logstash.conf

# If there are any arguments then we want to run those instead
if [[ "$1" == "-"* || -z $1 ]]; then
  exec /opt/logstash/bin/logstash agent -f /opt/logstash/config/logstash.conf "$@"
else
  exec "$@"
fi
