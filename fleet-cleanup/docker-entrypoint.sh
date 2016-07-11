#!/bin/bash
set -o nounset
set -o pipefail

if [ -z "$FLEET_HOST" ]; then
   echo "Missing FLEET_HOST environment variable"
   exit 1
fi

if [ -z "$FLEET_PORT" ]; then
   echo "Missing FLEET_HOST environment variable"
   exit 1
fi

if [ -z "$MACHINE_ID" ]; then
   echo "Missing MACHINE_ID environment variable"
   exit 1
fi

# HOST_IP=$(/usr/bin/ifconfig eth0 | sed -n '2 p' | awk '{print $2}' | cut -d':' -f2)
# MACHINE_ID=$(fleetctl list-machines -full | grep "$HOST_IP" | awk '{print $1}')
FLEET=$(curl -s "http://$FLEET_HOST:$FLEET_PORT/fleet/v1/state" | \
jq -c '.states[] | "\(.name) \(.machineID)"' | \
grep "$MACHINE_ID" | sed s~\"~~g | awk '{print $1}' | \
sed 's/\.service//g' | grep -v sidekick | sed s/@/-/g | sort | uniq)

DOCKER=$(docker ps -a --format "{{.Names}}" | sort | uniq)

# DIFF=$(diff --unchanged-line-format= --old-line-format= --new-line-format='%L' <(echo "$FLEET") <(echo "$DOCKER"))

for item in $(diff --unchanged-line-format= --old-line-format= --new-line-format='%L' <(echo "$FLEET") <(echo "$DOCKER")); do
  echo "Deleting a docker container $item"
  docker rm -f "$item"
done
