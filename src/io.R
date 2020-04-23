# ------------------------------------------------------------------------------
# I/O operations
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
# ------------------------------------------------------------------------------

# library(sparklyr) # needed for `spark_write_csv()`

load_csv <-function(filename, distributed=FALSE){
  # Load a .csv file as local dataframe or distributed dataframe

  df <- as.data.frame(read.csv(filename, sep = ","))

  if(distributed){
    print("INFO - Converting local dataframe to distributed dataframe...")
    distributed_df <- createDataFrame(df)
    return(distributed_df)
  } else {
    return(df)
  }
}

export_csv <-function(df, filename){
  # Export a local dataframe as a .csv file

  write.csv(df, filename, row.names=FALSE)
}

export_parquet <-function(df, filename){
  # Export a distributed dataframe as a .parquet file

  write.df(df, filename)
}
