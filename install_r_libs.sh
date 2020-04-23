#!/bin/bash

################################################################################
# Installation of required R libraries.
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
################################################################################

# Exit immediately if a command exits with a error status.
set -e

# Install Ubuntu dependancies
apt-get install -y libcurl4-openssl-dev

# Create script to install R libs.
# NOTE: Fill free to add any lib name to `required_packages` list below, as needed.
echo "print('INFO - Installing required R libraries'); \
required_packages <- c('dplyr', 'sparklyr'); \
installed_packages <- installed.packages()[,1]; \
to_install <- setdiff(required_packages, installed_packages); \
if (length(to_install) > 0) { install.packages(to_install, repos = 'https://cloud.r-project.org', quiet = TRUE); \
print('INFO - Succesfully installed required R libraries') } else { \
print('INFO - All required R libraries are already installed')}" >> install.R

# Install the R libraries.
Rscript "install.R"

# Clean up.
rm "install.R"
