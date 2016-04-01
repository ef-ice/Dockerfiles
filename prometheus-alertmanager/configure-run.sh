#!/bin/bash
set -o nounset

echo "Starting alertmanager service.."

if [ -z "$SLACK_API_URL" ]; then
   echo "Missing SLACK_API_URL environment variable"
   exit 1
fi

if [ -z "$SLACK_CHANNEL" ]; then
   echo "Missing SLACK_CHANNEL environment variable"
   exit 1
fi

sed -i s,SLACK_API_URL,$SLACK_API_URL,g /etc/alertmanager/alertmanager.yml
sed -i s,SLACK_CHANNEL,$SLACK_CHANNEL,g /etc/alertmanager/alertmanager.yml

/bin/alertmanager "$@"
