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

if [ -z "$LOGSTASH_NODES" ]; then
   echo "Missing LOGSTASH_NODES, e.g. [\"172.24.40.1:5044\",\"172.24.40.2:5044\"]"
   exit 1
fi

if [ -z "$FILEBEAT_ENV" ]; then
   echo "Missing FILEBEAT_ENV, e.g. QA, STG, LIVE"
   exit 1
fi

# sed -i "s~FILEBEAT_FILEPATH~$FILEBEAT_FILEPATH~g" filebeat.conf
# sed -i "s~LOGSTASH_NODES~$LOGSTASH_NODES~g" filebeat.conf
# cat "$FILEBEAT_CONFIG"

./filebeat -c "$FILEBEAT_CONFIG" -v -e
