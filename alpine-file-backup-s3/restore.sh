#!/bin/sh
backup=$1
directory=$2

aws s3 cp s3://$S3_BUCKET/$backup.tar.gz $backup.tar.gz

mkdir -p $directory
tar -xvzf $backup.tar.gz -C $directory --strip-components=1
rm $backup.tar.gz
