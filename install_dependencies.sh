#!/bin/bash
sudo echo "Installing dependencies..."
sudo mkdir -p /var/www/html/nodejs-app
sudo chown -R root:root /var/www/html/nodejs-app
sudo cd /var/www/html/nodejs-app
sudo npm install