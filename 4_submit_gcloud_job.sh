#!/bin/bash

################################################################################
# Job submittion to Spark server.
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
################################################################################

# Declare Google Cloud Platform project specifications.
source 0_set_gcloud_env.sh

# Copy source code to Gcloud Storage
gsutil -m rsync -r src gs://$BUCKET_NAME/src

# Submit a job to the Gcloud server (Spark server)
gcloud dataproc jobs submit spark-r gs://$BUCKET_NAME/src/main.R \
--cluster $CLUSTER_NAME \
--region $REGION \
--files "gs://$BUCKET_NAME/src/config.R","gs://$BUCKET_NAME/src/env.R","gs://$BUCKET_NAME/src/io.R","gs://$BUCKET_NAME/src/subroutines.R" \
