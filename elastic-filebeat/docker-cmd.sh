#!/bin/sh

echo "Starting filebeat service.."

FILEBEAT_CONFIG=filebeat.conf

if [ ! -f "$FILEBEAT_CONFIG" ]; then
   echo "Config file [$FILEBEAT_CONFIG] is missing"
   exit 1
fi

if [ -z "$FILEBEAT_FILEPATH" ]; then
   echo "Missing FILEBEAT_FILEPATH, e.g. /var/log/journald.log"
   exit 1
fi

if [ -z "$ELASTICSEARCH_NODES" ]; then
   echo "Missing ELASTICSEARCH_NODES, e.g. [\"172.24.40.1:9200\",\"172.24.40.2:9200\"]"
   exit 1
fi

sed -i "s~FILEBEAT_FILEPATH~$FILEBEAT_FILEPATH~g" filebeat.conf
sed -i "s~ELASTICSEARCH_NODES~$ELASTICSEARCH_NODES~g" filebeat.conf

cat "$FILEBEAT_CONFIG"

./filebeat -c "$FILEBEAT_CONFIG" -v -e
