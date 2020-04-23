# ------------------------------------------------------------------------------
# I/O operations
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
# ------------------------------------------------------------------------------

library(sparklyr)

load_csv <-function(filename){
  # Load a .csv file as local dataframe or distributed dataframe

  df <- as.data.frame(read.csv(filename, sep = ","))
  return(df)
}

load_distributed_csv <- function(filename, sc, name=NULL) {
  # Load a .csv file into a distributed dataframe
  df <- spark_read_csv(sc, name=name, path=filename)
  
  return(df)
}

export_csv <-function(df, filename) {
  # Export a local dataframe as a .csv file

  write.csv(df, filename, row.names=FALSE)
}

export_distributed_csv <- function(df, filename) {
  # Export a distributed dataframe as a .csv file

  # TODO: Find a way to prevent Spark from wriing the output in file pieces
  spark_write_csv(df, filename)
}
