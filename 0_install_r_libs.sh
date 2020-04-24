#!/bin/bash

################################################################################
# Installation of required R libraries.
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
################################################################################

# Exit immediately if a command exits with a error status.
set -e

# Install pre-required linux library
apt-get install -y libcurl4-openssl-dev libxml2-dev libssl-dev

# Create script to install R libs.
# TODO: Add lib names to `required_packages` list in the line below, as needed.
echo "required_packages <- c('dplyr', 'sparklyr'); \
print('INFO - Installing required R libraries'); \
installed_packages <- installed.packages()[,1]; \
to_install <- setdiff(required_packages, installed_packages); \
if (length(to_install) > 0) { install.packages(to_install, repos = 'https://cloud.r-project.org'); \
print('INFO - Successfully installed R required libraries') } else { \
print('INFO - All required R libraries are already installed')} " >> install.R

# Install the R libraries.
Rscript "install.R"

# Clean up.
rm "install.R"
