#!/bin/bash

if [ -z "$AWS_ACCESS_KEY_ID" ]; then
   echo "Missing AWS_ACCESS_KEY_ID environment variable"
   exit 1
fi

if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
   echo "Missing AWS_SECRET_ACCESS_KEY environment variable"
   exit 1
fi

if [ -z "$RESOURCE_NAME" ]; then
   echo "Missing RESOURCE_NAME environment variable"
   exit 1
fi

if [ -z "$RESOURCE_HOSTS" ]; then
   echo "Missing RESOURCE_HOSTS environment variable"
   exit 1
fi

# AWS credentials
echo "[Credentials]" >> /etc/boto.cfg
echo "aws_access_key_id = $AWS_ACCESS_KEY_ID" >> /etc/boto.cfg
echo "aws_secret_access_key = $AWS_SECRET_ACCESS_KEY" >> /etc/boto.cfg

# Updates resource file with provided values
cat resource-changes.json | \
jq '.Changes[].ResourceRecordSet.Name=env.RESOURCE_NAME' | \
jq 'del(.Changes[].ResourceRecordSet.ResourceRecords[])' \
> resource-changes.$$.json && \
mv resource-changes.$$.json resource-changes.json

for host in $(echo "$RESOURCE_HOSTS" | tr "," "\n"); do
  cat resource-changes.json | \
  jq --arg theHost $host '.Changes[].ResourceRecordSet.ResourceRecords |= (. + [{"Value":$theHost}])' \
  > resource-changes.$$.json
  mv resource-changes.$$.json resource-changes.json
done

jq '.' resource-changes.json

# Gets a hostzone ID
ZONE_ID=$(aws route53 list-hosted-zones --output=text | grep internal.efset.org. | cut -f3)

# Invokes a route change request
aws route53 change-resource-record-sets --hosted-zone-id $ZONE_ID \
--change-batch file://resource-changes.json
