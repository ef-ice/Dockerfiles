# Simple backup and restore to s3 buckets

### Running the container

#### for backup purposes
```docker run -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e S3_BUCKET=$S3_BUCKET_NAME -v /tmp:/data s3-backup /backup.sh backup-name /data-directory-to-backup```

#### for restore purposes

```docker run -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e S3_BUCKET=$S3_BUCKET_NAME -v /tmp:/data s3-backup /restore.sh backup-name-with-timestamp /restore-location```
