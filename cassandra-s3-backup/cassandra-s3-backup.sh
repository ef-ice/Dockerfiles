#!/bin/bash
set -o nounset
set -o pipefail
set -o errexit

if [ -z "$AWS_ACCESS_KEY_ID" ]; then
   echo "Missing AWS_ACCESS_KEY_ID environment variable"
   exit 1
fi

if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
   echo "Missing AWS_SECRET_ACCESS_KEY environment variable"
   exit 1
fi

if [ -z "$AWS_REGION" ]; then
   echo "Missing AWS_REGION environment variable"
   exit 1
fi

if [ -z "$S3_BUCKET" ]; then
   echo "Missing S3_BUCKET environment variable"
   exit 1
fi

if [ -z "$S3_BUCKET_PATH" ]; then
   echo "Missing S3_BUCKET_PATH environment variable"
   exit 1
fi

if [ -z "$CASSANDRA_KEYSPACE" ]; then
   echo "Missing CASSANDRA_KEYSPACE environment variable"
   exit 1
fi

if [ -z "$MAX_CONCURRENT_REQUESTS" ]; then
   echo "Missing MAX_CONCURRENT_REQUESTS environment variable, using default of 10"
else
  aws configure set default.s3.max_concurrent_requests $MAX_CONCURRENT_REQUESTS
fi

readonly YEAR=`date +"%Y"`
readonly MONTH=`date +"%m"`
readonly DATE=`date +"%d-%H-%M-%S"`
readonly SNAPSHOTID=`uuidgen --time`
readonly S3_PATH="$S3_BUCKET/$S3_BUCKET_PATH/$YEAR/$MONTH/$DATE/`cat /etc/hostname`"

echo "------ NEW RUN ------"
echo "Taking Cassandra snapshot for $YEAR-$MONTH-$DATE with id=$SNAPSHOTID"

nodetool snapshot --tag $SNAPSHOTID $CASSANDRA_KEYSPACE

readonly TABLES=`ls /var/lib/cassandra/data/$CASSANDRA_KEYSPACE`
for table in $TABLES
do
    echo ""
    echo "Sending all $table files one by one..."
    echo ""
    FILES=`find /var/lib/cassandra/data/$CASSANDRA_KEYSPACE/${table}/snapshots/$SNAPSHOTID -type f`
    for filename in $FILES
    do
	     aws s3 cp "$filename" "$S3_PATH$filename"
    done

    rm -rf /var/lib/cassandra/data/$CASSANDRA_KEYSPACE/${table}/snapshots/$SNAPSHOTID
done

echo "DONE!"
echo ""
