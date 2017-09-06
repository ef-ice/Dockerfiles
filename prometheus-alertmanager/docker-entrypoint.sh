#!/bin/sh
set -o nounset

echo "Starting alertmanager service.."

if [ -z "$TEAMS_WEB_HOOK" ]; then
   echo "Missing TEAMS_WEB_HOOK environment variable"
   exit 1
fi

if [ -z "$TEAMS_EMAIL" ]; then
   echo "Missing TEAMS_EMAIL environment variable"
   exit 1
fi


sed -i s,TEAMS_WEB_HOOK,$TEAMS_WEB_HOOK,g /etc/alertmanager/alertmanager.yml
sed -i s,TEAMS_EMAIL,$TEAMS_EMAIL,g /etc/alertmanager/alertmanager.yml

/bin/alertmanager "$@"
