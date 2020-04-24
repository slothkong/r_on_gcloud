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
--master-machine-type $MACHINE_TYPE --master-boot-disk-size 320 \
--num-workers $WORKES --worker-machine-type $MACHINE_TYPE --worker-boot-disk-size 320 --num-worker-local-ssds 0 \
--image-version $DISTRO \
--max-idle ${SHUTDOWN_AFTER}s \
--scopes "https://www.googleapis.com/auth/cloud-platform" \
--initialization-actions "gs://$BUCKET_NAME/0_install_r_libs.sh"
