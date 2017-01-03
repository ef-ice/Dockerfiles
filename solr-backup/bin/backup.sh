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

if [ -z "$prefix" ]; then
   echo "Missing env prefix environment variable"
   exit 1
fi

curl -o - -s http://$SOLR_HOST/solr/$CORE/replication?command=backup&wt=json | jq '.'

while ! curl -o - -s "http://$SOLR_HOST/solr/$CORE/replication?command=details&wt=json" | jq '.details.backup' | grep "success";
do
  echo "Sleeping 10 seconds for backup to complete..."
  sleep 10
done

for f in `find /var/lib/solr/data/$CORE/data/ -type d -name "snapshot.*"`;
do
  echo $f
  snapshot_file=$(echo $f | sed 's,/var/lib/solr/data/.*/data/,,g');
  aws s3 sync $f/ s3://$S3_BASE_PATH/$prefix/$snapshot_file;
done
