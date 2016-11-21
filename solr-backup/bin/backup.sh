#!/bin/sh
if [ -z "$AWS_ACCESS_KEY_ID" ]; then
   echo "Missing AWS_ACCESS_KEY_ID environment variable"
   exit 1
fi

if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
   echo "Missing AWS_SECRET_ACCESS_KEY environment variable"
   exit 1
fi

if [ -z "$SOLR_HOST" ]; then
   echo "Missing SOLR_HOST environment variable"
   exit 1
fi

if [ -z "$CORE" ]; then
   echo "Missing CORE environment variable"
   exit 1
fi

if [ -z "$S3_BASE_PATH" ]; then
   echo "Missing S3_BASE_PATH environment variable"
   exit 1
fi

curl -o - -s http://$SOLR_HOST/solr/$CORE/replication?command=backup&wt=json | jq '.'

while [[ curl -o - -s "http://$SOLR_HOST/solr/$CORE/replication?command=details&wt=json" | jq '.details.backup' | grep "fail" ]];
do
  echo "Sleeping 10 seconds for backup to complete..."
  sleep 10
done


aws s3 sync /var/lib/solr/data/$CORE/data/snapshot.* s3://$S3_BASE_PATH/
