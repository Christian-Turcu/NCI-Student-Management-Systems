#!/bin/bash

# Create AWS credentials directory
mkdir -p ~/.aws

# Create credentials file
cat > ~/.aws/credentials << EOL
[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}
aws_session_token = ${AWS_SESSION_TOKEN}
EOL

# Create config file
cat > ~/.aws/config << EOL
[default]
region = us-east-1
output = json
EOL

# Verify the configuration
aws configure list
