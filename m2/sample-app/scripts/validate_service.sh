#!/bin/bash
set -e

echo ">>> ValidateService: Checking application health..."

sleep 3

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/health)

if [ "$HTTP_CODE" -eq 200 ]; then
  echo ">>> Health check passed (HTTP $HTTP_CODE). Deployment validated."
  exit 0
else
  echo ">>> Health check FAILED (HTTP $HTTP_CODE). Deployment will roll back."
  exit 1
fi
