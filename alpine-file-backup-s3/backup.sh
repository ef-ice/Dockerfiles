#!/bin/sh
name=$1
directory=$2
instant=$(date +%Y%m%d%H%M%S)
tar -cvzf $name-$instant.tar.gz $directory
aws s3 cp $name-$instant.tar.gz s3://$S3_BUCKET/$name-$instant.tar.gz
rm $name-$instant.tar.gz
