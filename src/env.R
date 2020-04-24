# ------------------------------------------------------------------------------
# Setup of environment for execution of the main routine
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
# ------------------------------------------------------------------------------

declare_spark_lib_path <- function(spark_lib_path) {
  # Declare path to the Spark library installation

  if (nchar(Sys.getenv("SPARK_HOME")) < 1) {
    Sys.setenv(SPARK_HOME = spark_lib_path)
  }
}

update_spark_connection_config <- function(sc_config) {
  # Update the empty `sc_config` with user-defined configs

  sc_config$'sparklyr.shell.executor-memory' <- SPARKLYR_SHELL_EXECUTOR_MEMORY
  sc_config$'sparklyr.shell.driver-memory' <- SPARKLYR_SHELL_DRIVER_MEMORY
  sc_config$spark.excutor.cores <- SPARK_EXCUTOR_CORES
  sc_config$spark.excutor.memory <- SPARK_EXCUTOR_MEMORY
  sc_config$spark.yarn.am.cores <- SPARK_YARN_AM_CORES
  sc_config$spark.excutor.instances <- SPARK_EXCUTOR_INSTANCES
  sc_config$spark.dynamicAllocation.enableds <- SPARK_DYNAMICALLOCATION_ENABLED
  sc_config$maximizeResourceAllocation <- MAXIMIZERESOURCEALLOCATION
  sc_config$spark.default.parallelism <- SPARK_DEFAULT_PARALLELISM

  return (sc_config)

}
