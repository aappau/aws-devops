#!/bin/bash

AWS_ACCOUNT_ID=""
AWS_REGION="us-east-1"
REPOSITORY_NAME='demo'
TAG='latest'
IMAGE="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${REPOSITORY_NAME}"

# Retrieve an authentication token and authenticate your Docker client to your registry.
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# Build Docker image
docker build -t $REPOSITORY_NAME .

# Tag Image
docker tag $REPOSITORY_NAME:$TAG $IMAGE:$TAG

# Push Image to AWS Repositor
docker push $IMAGE:$TAG