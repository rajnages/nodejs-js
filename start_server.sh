#!/bin/bash
sudo echo "Starting Node.js server..."
# Ensure PM2 is installed globally
sudo npm install -g pm2
# Start the application
sudo pm2 start /var/www/html/nodejs-app/app.js --name "nodejs-app"