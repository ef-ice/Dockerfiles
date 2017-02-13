#!/bin/bash
set -o nounset

if [ -z "$SERVICE_IP" ]; then
   echo "Missing SERVICE_IP environment variable"
   exit 1
fi

if [ -z "$SERVICE_PORT" ]; then
   echo "Missing SERVICE_PORT environment variable"
   exit 1
fi

sed -i "s|SERVICE_IP|$SERVICE_IP|g" /opt/traefik/traefik.toml
sed -i "s|SERVICE_PORT|$SERVICE_PORT|g" /opt/traefik/traefik.toml

/entrypoint.sh --web --file --file.filename=/opt/traefik/traefik.toml --logLevel=DEBUG
