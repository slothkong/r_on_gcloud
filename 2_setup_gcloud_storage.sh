#!/bin/bash

################################################################################
# Gcloud Storage setup
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
################################################################################

# Declare Google Cloud Platform project specifications.
source 0_set_gcloud_env.sh

# Create Cloud Storage bucket for the input/output data.
gsutil mb -l $REGION gs://$BUCKET_NAME

# Upload data to Cloud Storage bucket
gsutil -m  rsync -r data gs://$BUCKET_NAME/data
