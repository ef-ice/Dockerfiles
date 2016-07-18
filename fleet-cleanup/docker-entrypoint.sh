#!/bin/bash
set -o nounset
set -o pipefail

if [ -z "$FLEET_HOST" ]; then
   echo "Missing FLEET_HOST environment variable"
   exit 1
fi

if [ -z "$FLEET_PORT" ]; then
   echo "Missing FLEET_PORT environment variable"
   exit 1
fi

# MACHINE_ID=$(fleetctl list-machines -full | grep "$HOST_IP" | awk '{print $1}')
if [ -z "$MACHINE_ID" ]; then
   echo "Missing MACHINE_ID environment variable"
   exit 1
fi

#
# Deleting dangling docker images
#
docker images --filter "dangling=true" -q | xargs -r docker rmi -f

#
# Deleting old docker images
#
for item in $(docker images --format '{{.Repository}}' | sort | uniq -cd | awk '{print $2}'); do
  echo "Deleting docker images for $item"
  docker images --format '{{.Repository}}:{{.Tag}}' | grep "$item" | sort -Vr | sed '1d' | xargs -r docker rmi -f
done

#
# Deleting irrelevant docker containers
#
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
