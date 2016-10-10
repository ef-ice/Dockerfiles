#!/bin/bash
set -o nounset

if [ -z "$PROXY_PASS_URL" ]; then
   echo "Missing PROXY_PASS_URL environment variable"
   exit 1
fi

sed -i "s/PROXY_PASS_URL/$PROXY_PASS_URL/g" /etc/nginx/conf/nginx.conf

nginx -g 'daemon off;'
