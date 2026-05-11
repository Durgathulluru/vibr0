#!/bin/bash
set -euo pipefail

ENVIRONMENT="${1:-dev}"
AWS_REGION="${AWS_REGION:-us-east-1}"
STACK_NAME="vibra-${ENVIRONMENT}-parent"
PARAMETER_FILE="infrastructure/cloudformation/parameters/${ENVIRONMENT}.json"

echo "Deploying parent stack..."
echo "Environment: ${ENVIRONMENT}"
echo "Stack name: ${STACK_NAME}"
echo "Parameter file: ${PARAMETER_FILE}"
echo "AWS region: ${AWS_REGION}"

aws cloudformation deploy \
  --stack-name "${STACK_NAME}" \
  --template-file infrastructure/cloudformation/parent.yml \
  --parameter-overrides file://"${PARAMETER_FILE}" \
  --capabilities CAPABILITY_NAMED_IAM \
  --region "${AWS_REGION}"

echo "Parent stack deployment completed."
