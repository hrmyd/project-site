#!/bin/bash

PROJECT_NAME=$1
BUCKET_NAME="$1-data"
SUBDOMAIN_NAME=$2

cd .

mkdir $PROJECT_NAME/
cd $PROJECT_NAME/

cp requirements.txt $PROJECT_NAME/requirements.txt

echo "runtime: custom
env: flex
service: $PROJECT_NAME

env_variables:
    BUCKET_NAME: $BUCKET_NAME" > app.yaml

echo "FROM python:3.7-slim

# Copy local code to the container image.
WORKDIR /app
COPY . ./" > Dockerfile

gsutil mb gs://$BUCKET_NAME/
