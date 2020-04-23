#!/bin/bash

################################################################################
# Gcloud server (Spark server) deployment
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
################################################################################

# Declare Google Cloud Platform project specifications.
source 0_set_gcloud_env.sh

# Copy the bash script to install R libs on the server.
gsutil cp 0_install_r_libs.sh  gs://$BUCKET_NAME/0_install_r_libs.sh

# Start a new Gcloud Server (Spark Server)
# NOTE: Server will shutdown if idle for SHUTDOWN_AFTER secs
gcloud dataproc clusters create $CLUSTER_NAME \
--project $PROJECT_ID --region $REGION --subnet default --zone  $REGION-d \
--master-machine-type n1-standard-2 --master-boot-disk-size 500 \
--num-workers $WORKES --worker-machine-type n1-standard-2 --worker-boot-disk-size 500 --num-worker-local-ssds 1 \
--image-version 1.5-ubuntu18 \
--max-idle ${SHUTDOWN_AFTER}s \
--scopes "https://www.googleapis.com/auth/cloud-platform" \
--initialization-actions "gs://$BUCKET_NAME/0_install_r_libs.sh"
