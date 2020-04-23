#!/bin/bash

################################################################################
# Job submittion to Spark server.
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
################################################################################

# Declare Google Cloud Platform project specifications.
PROJECT_ID=qfinforlife #myrproject # project name
REGION=europe-west1 # data center in Belgium

# Copy source code to Gcloud Storage
gsutil -m rsync -r src gs://$PROJECT_ID-bucket/src

# Submit a job to the Gcloud server (Spark server)
gcloud dataproc jobs submit spark-r gs://$PROJECT_ID-bucket/src/main.R \
--cluster $PROJECT_ID-cluster \
--region $REGION \
--files "gs://$PROJECT_ID-bucket/src/config.R","gs://$PROJECT_ID-bucket/src/env.R","gs://$PROJECT_ID-bucket/src/io.R","gs://$PROJECT_ID-bucket/src/subroutines.R"
