#!/bin/bash
# disk-alert.sh
# Checks disk usage and alerts if usage exceeds threshold

THRESHOLD=80

echo "=== Disk Usage Check ==="
df -h | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  USAGE=$(echo $output | awk '{ print $1}' | cut -d'%' -f1)
  PARTITION=$(echo $output | awk '{ print $2 }')

  if [ $USAGE -ge $THRESHOLD ]; then
    echo "ALERT: $PARTITION is at ${USAGE}% — exceeds ${THRESHOLD}% threshold"
  else
    echo "OK: $PARTITION is at ${USAGE}%"
  fi
done
echo "=== Check Complete ==="
