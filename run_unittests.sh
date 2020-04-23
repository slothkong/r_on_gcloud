#!/bin/bash

################################################################################
# Unnitest running & results reporting.
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
################################################################################

# Exit immediately if a command exits with a error status.
set -e

# Change to  `./src` directory.
cd src

# Run all unittests.
Rscript -e "testthat::test_dir('tests')"
