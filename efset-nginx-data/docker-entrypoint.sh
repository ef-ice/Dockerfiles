#!/bin/bash
set -o nounset

if [ -z "$PROXY_PASS_URL" ]; then
   echo "Missing PROXY_PASS_URL environment variable"
   exit 1
fi


if [ -z "$HOST_HEADER" ]; then
   echo "Missing HOST_HEADER environment variable"
   exit 1
fi
export NAMESERVERS=$(cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}' | tr '\n' ' ')
sed -i "s|resolver NAMESERVERS;|resolver $NAMESERVERS;|g" /etc/nginx/nginx.conf
sed -i "s|PROXY_PASS_URL|$PROXY_PASS_URL|g" /etc/nginx/nginx.conf
sed -i "s|HOST_HEADER|$HOST_HEADER|g" /etc/nginx/nginx.conf

nginx -g 'daemon off;'
