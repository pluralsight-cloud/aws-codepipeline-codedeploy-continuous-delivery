#!/bin/bash
set -e

echo ">>> ApplicationStart: Starting the application..."

cd /opt/globomantics-app
nohup node app.js > /opt/globomantics-app/app.log 2>&1 &
echo $! > /opt/globomantics-app/app.pid

sleep 3
if ! kill -0 "$(cat /opt/globomantics-app/app.pid)" 2>/dev/null; then
  echo ">>> Application failed to start. Check /opt/globomantics-app/app.log"
  exit 1
fi

echo ">>> Application started."
