#!/bin/sh

echo "Starting logstash service.."

if [ -z "$FILE_PATH" ]; then
   echo "Missing FILE_PATH, e.g. /var/log/journald.log"
   exit 1
fi

if [ -z "$ELASTICSEARCH_NODES" ]; then
   echo "Missing ELASTICSEARCH_NODES, e.g. [\"172.24.40.1:9200\",\"172.24.40.2:9200\"]"
   exit 1
fi

sed -i "s~FILE_PATH~$FILE_PATH~g" /opt/logstash/config/logstash.conf
sed -i "s~ELASTICSEARCH_NODES~$ELASTICSEARCH_NODES~g" /opt/logstash/config/logstash.conf

cat /opt/logstash/config/logstash.conf

/opt/logstash/bin/logstash agent -f /opt/logstash/config/logstash.conf
