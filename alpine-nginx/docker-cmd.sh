#!/bin/bash
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

function parseServers() {
  local servers=(${1//,/ })

  local result=""

  for i in "${!servers[@]}"; do
    result=$(printf "%sVulcand server %s; " "$result" "${servers[i]}")
  done

  echo "$result"
}

READY_SERVERS=$(parseServers $VULCAND_SERVERS)
echo $READY_SERVERS
sed -i "s/VULCAND_SERVERS/$READY_SERVERS/g" nginx.conf

htpasswd -b -c /etc/nginx/.htpasswd $USERNAME $PASSWORD

nginx
