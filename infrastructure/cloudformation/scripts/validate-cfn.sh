#!/bin/bash
set -euo pipefail

AWS_REGION="${AWS_REGION:-us-east-1}"

echo "Validating CloudFormation templates..."
echo "AWS region: ${AWS_REGION}"

echo "Validating child template: network.yml"
aws cloudformation validate-template \
  --template-body file://infrastructure/cloudformation/children/network.yml \
  --region "${AWS_REGION}"

echo "Validating parent template: parent.yml"
aws cloudformation validate-template \
  --template-body file://infrastructure/cloudformation/parent.yml \
  --region "${AWS_REGION}"

echo "CloudFormation template validation completed successfully."