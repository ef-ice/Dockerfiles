#!/bin/sh
set -o nounset

echo "Starting nginx service.."

if [ -z "$USERNAME" ]; then
   echo "Missing USERNAME environment variable"
   exit 1
fi

if [ -z "$PASSWORD" ]; then
   echo "Missing PASSWORD environment variable"
   exit 1
fi

if [ -z "$VULCAND_SERVERS" ]; then
   echo "Missing VULCAND_SERVERS environment variable"
   exit 1
fi

echo "$(bash servers.sh $VULCAND_SERVERS)"

sed -i "s~VULCAND_SERVERS~$(servers.sh $VULCAND_SERVERS)~g" nginx.conf

htpasswd -b -c /etc/nginx/.htpasswd $USERNAME $PASSWORD

nginx
