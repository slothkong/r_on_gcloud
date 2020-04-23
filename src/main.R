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
  declare_libs_path(SPARK_LIB_PATH)
  library(SparkR, lib.loc = c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib")))
  sparkR.session(master = SERVER_IP)
  warmup_distributed_subroutine(DEBUG) # test distributed operations
}

# # Data loading
# start_time <- Sys.time()
# print("INFO - Loading data...")
# ratings_df = load_csv(INPUT_FILENAME, DISTRIBUTED)
# 
# # Data processing
# print("INFO - Processing data...")
# 
# mean_ratings_df <- compute_mean_ratings(ratings_df, DISTRIBUTED, DEBUG)
# mean_ratings_df <- sort_mean_ratings(mean_ratings_df, DISTRIBUTED, DEBUG)
# mean_ratings_df <- sort_movies_ids(mean_ratings_df, DISTRIBUTED, DEBUG)
# 
# # Data saving
# print("INFO - Exporting data...")
# if(DISTRIBUTED) {
#   export_parquet(mean_ratings_df, OUTPUT_FILENAME)
#   sparkR.session.stop()
# } else {
#   export_csv(mean_ratings_df, OUTPUT_FILENAME)
# }
# 
# end_time <- Sys.time()
# sprintf("INFO - All done in %.3f s", end_time - start_time)
