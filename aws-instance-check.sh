#!/bin/bash
# aws-instance-check.sh
# Lists all EC2 instances and their current state

REGION=${1:-us-east-1}

echo "=== EC2 Instance Status Check — Region: $REGION ==="

aws ec2 describe-instances \
  --region $REGION \
  --query 'Reservations[*].Instances[*].[InstanceId,InstanceType,State.Name,Tags[?Key==`Name`].Value|[0]]' \
  --output table

echo "=== Check Complete ==="
