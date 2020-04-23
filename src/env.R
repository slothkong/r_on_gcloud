# ------------------------------------------------------------------------------
# Declaration of enverimental variables for main execution routine
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
# ------------------------------------------------------------------------------

declare_libs_path <- function(spark_lib_path) {
  # Declare path to the Spark library installation

  if (nchar(Sys.getenv("SPARK_HOME")) < 1) {
    Sys.setenv(SPARK_HOME = spark_lib_path)
  }
}
