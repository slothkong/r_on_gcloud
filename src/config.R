# ------------------------------------------------------------------------------
# Configurations for main execution routine
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
# ------------------------------------------------------------------------------

DEBUG = TRUE # to easily turn on/off the print statements
DISTRIBUTED = TRUE # to select either to run locally or on Gcloud Spark Server

if(DISTRIBUTED) {
  INPUT_FILENAME = "gs://myrproject-bucket/ratings_sample.csv" # path to input data
  OUTPUT_FILENAME =  "gs://myrproject-bucket/mean_ratings_sample.parquet" # path to output data
  SERVER_IP = "local[*]" # IP of the Gcloud Spark Server
  SPARK_LIB_PATH = "/usr/local/spark"
} else {
  INPUT_FILENAME = "../data/ratings_sample.csv" # path to input data
  OUTPUT_FILENAME =  "../data/mean_ratings_sample.csv" # path to output data
}
