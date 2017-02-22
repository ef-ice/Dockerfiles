#!/bin/sh
set -o nounset

echo "Starting prometheus service.."

if [ -z "$PLATFORM_TAG_REGEX" ]; then
   echo "Missing PLATFORM_TAG_REGEX environment variable"
   exit 1
fi

if [ -z "$ENVIRONMENT_TAG_REGEX" ]; then
   echo "Missing ENVIRONMENT_TAG_REGEX environment variable"
   exit 1
fi

if [ -z "$CATEGORY_TAG_REGEX" ]; then
   echo "Missing CATEGORY_TAG_REGEX environment variable"
   exit 1
fi

if [ -z "$AWS_REGION" ]; then
   echo "Missing AWS_REGION environment variable"
   exit 1
fi

sed -i s,PLATFORM_TAG_REGEX,$PLATFORM_TAG_REGEX,g /etc/prometheus/prometheus.yml
sed -i s,ENVIRONMENT_TAG_REGEX,$ENVIRONMENT_TAG_REGEX,g /etc/prometheus/prometheus.yml
sed -i s,CATEGORY_TAG_REGEX,$CATEGORY_TAG_REGEX,g /etc/prometheus/prometheus.yml
sed -i s,AWS_REGION,$AWS_REGION,g /etc/prometheus/prometheus.yml

cat /etc/prometheus/prometheus.yml

/bin/prometheus "$@"
