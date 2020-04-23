#!/bin/bash

################################################################################
# Gcloud server (Spark server) creation
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
################################################################################

# Declare Google Cloud Platform project specifications.
PROJECT_ID=rongcloud # project name
REGION=europe-west1 # data center in Belgium
WORKES=2 # number of nodes on the Gcloud Server (Spark Server workes)
SHUTDOWN_AFTER=3600 # will shutdown if idle for SHUTDOWN_AFTER secs


# Copy the bash script to install R libs on the server.
gsutil cp 0_install_r_libs.sh  gs://$PROJECT_ID-bucket/init/0_install_r_libs.sh

# Start a new Gcloud Server (Spark Server)
# NOTE: Server will shutdown if idle for SHUTDOWN_AFTER secs
gcloud dataproc clusters create $PROJECT_ID-cluster \
--project $PROJECT_ID --region $REGION --subnet default --zone  $REGION-d \
--master-machine-type n1-standard-2 --master-boot-disk-size 500 \
--num-workers $WORKES --worker-machine-type n1-standard-2 --worker-boot-disk-size 500 --num-worker-local-ssds 1 \
--image-version 1.5-ubuntu18 \
--max-idle ${SHUTDOWN_AFTER}s \
--scopes "https://www.googleapis.com/auth/cloud-platform" \
--initialization-actions "gs://"${PROJECT_ID}"-bucket/init/0_install_r_libs.sh"
