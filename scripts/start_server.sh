#!/bin/bash
echo "Starting Node.js server..."
# Ensure PM2 is installed globally
npm install -g pm2
# Start the application
pm2 start /var/www/html/nodejs-app/app.js --name "nodejs-app"