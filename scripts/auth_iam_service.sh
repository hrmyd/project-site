#!/bin/bash

SERVICE_ACCOUNT=$1
PROJECT_ID=$2
KEY_NAME=$SERVICE_ACCOUNT-key.json

gcloud iam service-accounts create $SERVICE_ACCOUNT
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member "serviceAccount:$SERVICE_ACCOUNT@$PROJECT_ID.iam.gserviceaccount.com" --role "roles/owner"
gcloud iam service-accounts keys create ~/$KEY_NAME \
  --iam-account $SERVICE_ACCOUNT@$PROJECT-ID.iam.gserviceaccount.com
