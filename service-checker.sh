#!/bin/bash
# service-checker.sh
# Checks if a given service is running or stopped

SERVICE=$1

if [ -z "$SERVICE" ]; then
  echo "Usage: ./service-checker.sh <service-name>"
  exit 1
fi

echo "=== Checking Service: $SERVICE ==="

if systemctl is-active --quiet $SERVICE; then
  echo "STATUS: $SERVICE is RUNNING"
else
  echo "ALERT: $SERVICE is STOPPED or NOT FOUND"
  echo "Attempting to get more details..."
  systemctl status $SERVICE
fi

echo "=== Check Complete ==="
