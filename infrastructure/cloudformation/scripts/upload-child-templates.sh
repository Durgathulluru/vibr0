#!/bin/bash

set -euo pipefail

ENVIRONMENT="${1:-dev}"

AWS_REGION="${AWS_REGION:-us-east-1}"

ARTIFACT_BUCKET="vibra-cfn-artifacts-${ENVIRONMENT}"

echo "Uploading child templates for environment: ${ENVIRONMENT}"

echo "Artifact bucket: ${ARTIFACT_BUCKET}"

echo "AWS region: ${AWS_REGION}"

aws s3 cp \

  infrastructure/cloudformation/children/network.yml \

  "s3://${ARTIFACT_BUCKET}/children/network.yml" \

  --region "${AWS_REGION}"

echo "Upload completed."
