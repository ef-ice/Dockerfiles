#!/bin/sh
set -e

# SET DEFAULT VALUES IF NOT SET
ELASTICSEARCH_DATA=${ELASTICSEARCH_DATA:-/var/services/data/elasticsearch}
ELASTICSEARCH_LOG=${ELASTICSEARCH_LOG:-/var/services/log/}
ELASTICSEARCH_LOG_LEVEL=${ELASTICSEARCH_LOG_LEVEL:-INFO}
ES_HEAP_SIZE=${ES_HEAP_SIZE:-512M}

if [ "$1" = 'elasticsearch' ]; then
  # SET ENV VARS IN elasticsearch.yml
  if grep -qv -e "-ELASTICSEARCH_DATA-" /elasticsearch/config/elasticsearch.yml; then
    echo "updating elasticsearch.yml"
    sed -i \
      -e "s#-ELASTICSEARCH_DATA-#${ELASTICSEARCH_DATA}#" \
      -e "s#-ELASTICSEARCH_LOG-#${ELASTICSEARCH_LOG}#" \
      /elasticsearch/config/elasticsearch.yml
    if [ -n "$ELASTICSEARCH_YML_APPEND" ]; then
      (echo; echo "$ELASTICSEARCH_YML_APPEND") >> /elasticsearch/config/elasticsearch.yml
    fi
  fi

  # SETUP
  mkdir -p $ELASTICSEARCH_DATA
  mkdir -p $ELASTICSEARCH_LOG

  # RUN
  exec /elasticsearch/bin/elasticsearch -Des.logger.level=$ELASTICSEARCH_LOG_LEVEL
fi
exec "$@"
