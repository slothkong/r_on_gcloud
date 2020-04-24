#!/bin/bash

################################################################################
# Declare enviromental variables temporarily required other shell scripts
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
################################################################################

# Declare Google Cloud Platform project specifications.
export PROJECT_ID=rongcloud # project name
export REGION=europe-west1 # data center in Belgium
export CLUSTER_NAME="$PROJECT_ID-cluster" # Dataproc cluster name
export BUCKET_NAME="$PROJECT_ID-bucket" # Cloud Storage bucket name
export WORKES=2 # number of nodes on the Gcloud Server (Spark Server workes)
export SHUTDOWN_AFTER=3600 # will SHUTDOWN_AFTER if idle for specified time
export MACHINE_TYPE=n1-standard-8 # 8vCPU 30 GB memory
export DISTRO=1.3-debian9 # Debian 9, Hadoop 2.9, Spark 2.3
