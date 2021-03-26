#!/bin/sh -e
export TAG=terraform14
export AWSUME_ACCOUNT=<account profile where the ECR is located>
export REGISTRY_ALIAS=<registry alias for the public repository>
export REGISTRY_URI=public.ecr.aws
export AWS_REGION=us-east-1
export IMAGE_NAME=autostaging/auto-staging-codebuild
### build
# Login to DockerHub if you cannot use public base image
# docker login -u $DOCKERHUB_USER
docker build -t $IMAGE_NAME ./$TAG
### push
# login to AWS
# https://docs.aws.amazon.com/AmazonECR/latest/public/docker-push-ecr-image.html
# https://docs.aws.amazon.com/AmazonECR/latest/public/public-registries.html#public-registry-auth
awsume $AWSUME_ACCOUNT
# aws sts get-caller-identity
aws ecr-public get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $REGISTRY_URI
# latest tag is default
docker push $REGISTRY_URI/$REGISTRY_ALIAS/$IMAGE_NAME
# create tag
docker tag $IMAGE_NAME:latest $REGISTRY_URI/$REGISTRY_ALIAS/$IMAGE_NAME:$TAG
docker push $REGISTRY_URI/$REGISTRY_ALIAS/$IMAGE_NAME:$TAG
docker logout $REGISTRY_URI
