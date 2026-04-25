#!/bin/bash
# log-checker.sh
# Scans a log file and prints all ERROR and WARNING lines

LOG_FILE=$1

if [ -z "$LOG_FILE" ]; then
  echo "Usage: ./log-checker.sh <log-file>"
  exit 1
fi

echo "=== ERROR Lines ==="
grep -i "error" $LOG_FILE

echo "=== WARNING Lines ==="
grep -i "warning" $LOG_FILE

echo "=== Done ==="
