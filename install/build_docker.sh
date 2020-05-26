#!/usr/bin/env bash

VERSION=${1:-0.0.0}
DOCKERFILE_LOC=${2:-install/Dockerfile}
PROJECT_NAME=${3:-pig-e}
REGISTRY_NAME=${4:-435901930649.dkr.ecr.us-east-1.amazonaws.com}

DOCKER_BUILD=$REGISTRY_NAME/$PROJECT_NAME:$VERSION
DOCKER_LATEST=$REGISTRY_NAME/$PROJECT_NAME:latest

echo "Running as"
whoami

echo "Moving Dockerfile"
echo $DOCKERFILE_LOC
cp $DOCKERFILE_LOC Dockerfile

echo "Building and Pushing docker image"
echo $DOCKER_BUILD
docker build -t $DOCKER_BUILD .
docker push $DOCKER_BUILD

#echo "Building and Pushing docker latest"
#echo $DOCKER_LATEST
#docker build -t $DOCKER_LATEST .
#docker push $DOCKER_LATEST

#echo "Cleaning local images"
#docker rmi $DOCKER_BUILD
#docker rmi $DOCKER_LATEST