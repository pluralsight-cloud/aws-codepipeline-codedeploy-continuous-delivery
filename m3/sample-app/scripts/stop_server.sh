#!/bin/bash

echo ">>> ApplicationStop: Stopping the application..."

if [ -f /opt/globomantics-app/app.pid ]; then
  kill "$(cat /opt/globomantics-app/app.pid)" 2>/dev/null || true
  rm -f /opt/globomantics-app/app.pid
else
  pkill -f "node app.js" || true
fi

echo ">>> Application stopped."
