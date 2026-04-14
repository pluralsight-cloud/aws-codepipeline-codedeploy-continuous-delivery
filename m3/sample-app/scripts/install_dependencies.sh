#!/bin/bash
set -e

echo ">>> BeforeInstall: Installing dependencies..."

cd /opt/globomantics-app
chown -R ec2-user:ec2-user /opt/globomantics-app
sudo -u ec2-user npm install --omit=dev

echo ">>> Dependencies installed successfully."
