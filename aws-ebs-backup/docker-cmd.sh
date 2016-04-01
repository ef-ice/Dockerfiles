#!/bin/sh

if [ -z "$AWS_ACCESS_KEY_ID" ]; then
   echo "Missing AWS_ACCESS_KEY_ID environment variable"
   exit 1
fi

if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
   echo "Missing AWS_SECRET_ACCESS_KEY environment variable"
   exit 1
fi

if [ -z "$AWS_DEFAULT_REGION" ]; then
   echo "Missing AWS_DEFAULT_REGION environment variable"
   exit 1
fi

if [ -z "$ENVIRONMENT_TAG" ]; then
   echo "Missing ENVIRONMENT_TAG environment variable"
   exit 1
fi

if [ -z "$DEVICE_NAME" ]; then
   echo "Missing DEVICE_NAME environment variable"
   exit 1
fi

# INSTANCE_IDS=$(aws ec2 describe-instances \
# --filter Name=tag:environment-tag,Values=$ENVIRONMENT_TAG \
# | jq '{"instanceIds": [.Reservations[].Instances[].InstanceId]}')
# INSTANCE_IDS=`echo $INSTANCE_IDS`
# echo "Instances: $INSTANCE_IDS"

echo "[Credentials]" >> /etc/boto.cfg
echo "aws_access_key_id = $AWS_ACCESS_KEY_ID" >> /etc/boto.cfg
echo "aws_secret_access_key = $AWS_SECRET_ACCESS_KEY" >> /etc/boto.cfg

## activate virtual environment
virtualenv --system-site-packages /.venv && . /.venv/bin/activate

VOLUMES=$(aws ec2 describe-instances \
--filter "Name=tag:environment-tag,Values=$ENVIRONMENT_TAG" \
"Name=block-device-mapping.device-name,Values=$DEVICE_NAME" \
| jq "{\"volumes\": [.Reservations[].Instances[].BlockDeviceMappings[] \
| select(.DeviceName | contains(\"$DEVICE_NAME\")) | .Ebs.VolumeId]}")
VOLUMES=`echo $VOLUMES`
echo "Volumes: $VOLUMES"

ansible-playbook -vvv -i ~/.ansible_hosts /opt/roles/backup.yaml \
  --extra-vars "$VOLUMES" \
  --extra-vars " \
  aws_access_key_id=$AWS_ACCESS_KEY_ID \
  aws_secret_access_key=$AWS_SECRET_ACCESS_KEY \
  region=$AWS_DEFAULT_REGION"
