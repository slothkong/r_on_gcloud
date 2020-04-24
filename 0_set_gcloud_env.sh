#!/bin/bash

################################################################################
# Declare enviromental variables temporarily required other shell scripts
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
################################################################################

# Declare Google Cloud Platform project specifications.
PROJECT_ID=rongcloud # project name
REGION=europe-west1 # data center in Belgium
CLUSTER_NAME="$PROJECT_ID-cluster" # Dataproc cluster name
BUCKET_NAME="$PROJECT_ID-bucket" # Cloud Storage bucket name
WORKES=2 # number of nodes on the Gcloud Server (Spark Server workes)
SHUTDOWN_AFTER=3600 # will shutdown if idle for specified time
MASTER_TYPE=n1-standard-4 # `standard-4` for 4vCPU/15GB memory 
WORKER_TYPE=n1-standard-4 # `standard-8` for 8vCPU/30GB memory  
