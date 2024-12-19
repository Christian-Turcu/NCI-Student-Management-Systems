#!/bin/bash

# Get the instance ID
INSTANCE_ID="i-0b522d89e88978674"

# Get the security group ID
SECURITY_GROUP_ID=$(aws ec2 describe-instances \
  --instance-ids $INSTANCE_ID \
  --query 'Reservations[0].Instances[0].SecurityGroups[0].GroupId' \
  --output text)

# Add inbound rule for port 3000
aws ec2 authorize-security-group-ingress \
  --group-id $SECURITY_GROUP_ID \
  --protocol tcp \
  --port 3000 \
  --cidr 0.0.0.0/0
