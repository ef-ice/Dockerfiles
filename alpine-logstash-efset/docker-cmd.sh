#!/bin/sh

echo "Starting logstash service.."

LOGSTASH_CONFIG=/opt/logstash-1.5.3/config/akamai_logstash.conf

if [ -z "$FILE_PATH" ]; then
   echo "Missing FILE_PATH, e.g. /var/log/journald.log"
   exit 1
fi

if [ -z "$ELASTICSEARCH_NODES" ]; then
   echo "Missing ELASTICSEARCH_NODES, e.g. [\"172.24.40.1:9200\",\"172.24.40.2:9200\"]"
   exit 1
fi

sed -i "s~FILE_PATH~$FILE_PATH~g" /opt/logstash-1.5.3/config/akamai_logstash.conf
sed -i "s~ELASTICSEARCH_NODES~$ELASTICSEARCH_NODES~g" /opt/logstash-1.5.3/config/akamai_logstash.conf

cat "$LOGSTASH_CONFIG"

/opt/logstash-1.5.3/bin/logstash agent --debug -f /opt/logstash-1.5.3/config/akamai_logstash.conf
