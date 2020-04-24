# ------------------------------------------------------------------------------
# Main execution routine
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
# ------------------------------------------------------------------------------

source("config.R")
source("io.R")
source("env.R")
source("subroutines.R")

if(DISTRIBUTED) {
  declare_spark_lib_path(SPARK_LIB_PATH)
  library(sparklyr)
  sc_config <-spark_config()
  sc_config <- update_spark_connection_config(sc_config)
  sc <- spark_connect(master="local", config=sc_config)
}

# Data loading
start_time <- Sys.time()
print("INFO - Loading data...")
if(DISTRIBUTED) {
  ratings_df = load_distributed_csv(INPUT_FILENAME, sc, "ratings")

} else {
  ratings_df = load_csv(INPUT_FILENAME)

}

# Data processing
print("INFO - Processing data...")

mean_ratings_df <- compute_mean_ratings(ratings_df, DEBUG)
mean_ratings_df <- sort_mean_ratings(mean_ratings_df, DEBUG)
mean_ratings_df <- sort_movies_ids(mean_ratings_df, DEBUG)

# Data saving
print("INFO - Exporting data...")
if(DISTRIBUTED) {
  export_distributed_csv(mean_ratings_df, OUTPUT_FILENAME)

} else {
  export_csv(mean_ratings_df, OUTPUT_FILENAME)

}

end_time <- Sys.time()
sprintf("INFO - All done in %.3f s", end_time - start_time)
