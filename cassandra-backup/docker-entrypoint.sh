#!/bin/bash -xe

if [ -z "$AWS_ACCESS_KEY_ID" ]; then
   echo "Missing AWS_ACCESS_KEY_ID environment variable"
   exit 1
fi

if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
   echo "Missing AWS_SECRET_ACCESS_KEY environment variable"
   exit 1
fi

if [ -z "$CASSANDRA_HOSTS" ]; then
   echo "Missing CASSANDRA_HOSTS environment variable"
   exit 1
fi

if [ -z "$S3_BASE_PATH" ]; then
   echo "Missing S3_BASE_PATH environment variable"
   exit 1
fi

if [ -z "$SSH_KEY" ]; then
   echo "Missing SSH_KEY environment variable"
   exit 1
fi

mkdir -p /root/.ssh && \
echo "$SSH_KEY" > /root/.ssh/id_rsa && \
chmod 400 /root/.ssh/id_rsa

cassandra-snapshotter \
--s3-bucket-name=efset-cassandra-backups \
--s3-bucket-region=eu-west-1 \
--s3-base-path=$S3_BASE_PATH \
--aws-access-key-id=$AWS_ACCESS_KEY_ID \
--aws-secret-access-key=$AWS_SECRET_ACCESS_KEY \
backup \
--hosts=$CASSANDRA_HOSTS \
--user=ubuntu \
--sshkey=/root/.ssh/id_rsa \
--keyspaces=athena
