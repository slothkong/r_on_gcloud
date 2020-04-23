#!/bin/bash

################################################################################
# Gcloud projet creation
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
################################################################################

# Declare Google Cloud Platform project specifications.
source 0_set_gcloud_env.sh

project_exists=$(gcloud projects list | grep -w $PROJECT_ID)

if [ "$project_exists" ]
then
  echo "Project `$PROJECT_ID` already exists."

else
  # Create a new projet in Google Cloud Platform.
  gcloud projects create $PROJECT_ID --set-as-default
fi
