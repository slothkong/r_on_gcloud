#!/bin/bash

################################################################################
# Gcloud Storage setup
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
################################################################################

# Declare Google Cloud Platform project specifications.
PROJECT_ID=rongcloud # project name
REGION=europe-west1 # data center in Belgium

# Create Cloud Storage bucket for the input/output data.
gsutil mb -l $REGION gs://$PROJECT_ID-bucket

# Upload data to Cloud Storage bucket
gsutil -m  rsync -r data gs://$PROJECT_ID-bucket/data
