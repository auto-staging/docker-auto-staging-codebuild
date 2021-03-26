#!/bin/sh -e

export TAG=terraform14
# ECR is located in TS prod guarantee account, later change to the new one
export WSUME_ACCOUNT=prod
#export AWS_ACCOUNT_ID=636672185349
export REGISTRY_URI=public.ecr.aws
export REGISTRY_ALIAS=u1c8d5f2
export AWS_REGION=us-east-1
export IMAGE_NAME=autostaging/auto-staging-codebuild
# get-login has been removed in cli v2 https://github.com/aws/aws-cli/issues/5014
# https://docs.aws.amazon.com/AmazonECR/latest/userguide/Registries.html
# Login to DockerHub if you cannot use public base image
# docker login -u $DOCKERHUB_USER
# login to AWS
awsume $AWSUME_ACCOUNT
aws sts get-caller-identity
aws ecr-public get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $REGISTRY_URI
# build and push the latest
docker build -t $IMAGE_NAME ./$TAG

#docker tag $IMAGE_NAME:latest $REGISTRY/$IMAGE_NAME:latest
docker push $REGISTRY_URI/$REGISTRY_ALIAS/$IMAGE_NAME
# create tag
docker tag $IMAGE_NAME:latest $REGISTRY_URI/$REGISTRY_ALIAS/$IMAGE_NAME:$TAG
docker push $REGISTRY_URI/$REGISTRY_ALIAS/$IMAGE_NAME:$TAG
docker logout $REGISTRY_URI
# public.ecr.aws/u1c8d5f2/autostaging/auto-staging-codebuild:latest
