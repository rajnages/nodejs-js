#!/bin/bash

# Update package manager and install dependencies
echo "Updating package manager and installing dependencies..."
apt-get update -y
apt-get install -y ruby wget

# Determine the AWS region of the instance
echo "Detecting AWS region..."
REGION=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | grep region | awk -F\" '{print $4}')
if [ -z "$REGION" ]; then
  echo "Failed to detect AWS region. Exiting."
  exit 1
fi

# Download and install the CodeDeploy agent
echo "Downloading and installing the CodeDeploy agent for region: $REGION..."
cd /tmp
wget https://aws-codedeploy-${REGION}.s3.${REGION}.amazonaws.com/latest/install
chmod +x ./install

# Run the installation script
echo "Installing CodeDeploy agent..."
./install auto

# Check if the installation was successful
if systemctl is-active --quiet codedeploy-agent; then
  echo "CodeDeploy agent installed and running."
else
  echo "Failed to install or start CodeDeploy agent. Exiting."
  exit 1
fi

# Ensure the CodeDeploy agent starts on boot
echo "Enabling CodeDeploy agent to start on boot..."
systemctl enable codedeploy-agent

echo "CodeDeploy agent setup complete."