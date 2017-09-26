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

if [ -z "EMAIL_ACCOUNT" ]; then
   echo "Missing EMAIL_ACCOUNT environment variable"
   exit 1
fi

if [ -z "EMAIL_AUTH_TOKEN" ]; then
   echo "Missing EMAIL_AUTH_TOKEN environment variable"
   exit 1
fi


sed -i s,TEAMS_WEB_HOOK,$TEAMS_WEB_HOOK,g /etc/alertmanager/alertmanager.yml
sed -i s,TEAMS_EMAIL,$TEAMS_EMAIL,g /etc/alertmanager/alertmanager.yml
sed -i s,EMAIL_ACCOUNT,EMAIL_ACCOUNT,g /etc/alertmanager/alertmanager.yml
sed -i s,EMAIL_AUTH_TOKEN,EMAIL_AUTH_TOKEN,g /etc/alertmanager/alertmanager.yml

/bin/alertmanager "$@"
