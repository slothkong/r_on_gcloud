# ------------------------------------------------------------------------------
# Configurations for main execution routine
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
# ------------------------------------------------------------------------------

DEBUG = TRUE # to easily turn on/off the print statements
DISTRIBUTED = TRUE # to select either to run locally or on Gcloud Spark Server

if(DISTRIBUTED) {
  INPUT_FILENAME = "gs://rongcloud-bucket/data/ratings_sample.csv" # path to input data
  OUTPUT_FILENAME =  "gs://rongcloud-bucket/results/mean_ratings_sample.csv" # path to output data
  
  SERVER_IP = "local" # IP of the Gcloud Spark Server
  SPARK_LIB_PATH = "/usr/lib/spark" # "/usr/local/spark" in Ubuntu 16.04
  
  SPARKLYR_SHELL_EXECUTOR_MEMORY = "10G" # TODO: Add description
  SPARKLYR_SHELL_DRIVER_MEMORY = "10G" # TODO: Add description
  SPARK_EXCUTOR_CORES = 8 # TODO: Add description
  SPARK_EXCUTOR_MEMORY = "10" # TODO: Add description
  SPARK_YARN_AM_CORES = 8  # TODO: Add description (16 available)
  SPARK_YARN_AM_MEMORY = "10G" # TODO: Add description ("48G" available)
  SPARK_EXCUTOR_INSTANCES = 2 # TODO: Add description
  SPARK_DYNAMICALLOCATION_ENABLED = "false" # TODO: Add description
  MAXIMIZERESOURCEALLOCATION = "true" # TODO: Add description
  SPARK_DEFAULT_PARALLELISM = 16 # TODO: Add description

} else {
  INPUT_FILENAME = "../data/ratings_sample.csv" # path to input data
  OUTPUT_FILENAME =  "../results/mean_ratings_sample.csv" # path to output data
  
}
