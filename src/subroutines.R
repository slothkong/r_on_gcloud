# ------------------------------------------------------------------------------
# Subroutines need to carry out the main execution routine
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
# ------------------------------------------------------------------------------

library(dplyr)

compute_mean_ratings <- function(ratings_df, debug=FALSE) {
  # Compute the mean of columns in the ratings dataframe

  mean_ratings_df <- group_by(ratings_df, movieId) %>% summarize(
    meanRating = mean(rating,  na.rm = TRUE)) # group by movie and average ratings

  if(debug) {
    print("DEBUG - df of mean ratings:")
    print(head(mean_ratings_df))
  }

  return(mean_ratings_df)
}

sort_mean_ratings <-function(mean_ratings_df, debug=FALSE) {
  # Sort the movies in descending order accordig to their mean rating

  mean_ratings_df <- arrange(mean_ratings_df, desc(meanRating))

  if(debug) {
    print("DEBUG - df sorted by mean rating:")
    print(head(mean_ratings_df))
  }

  return(mean_ratings_df)
}

sort_movies_ids <-function(ratings_df, debug=FALSE) {
  # Sort the movies in descending order accordig to their ID


  ratings_df <- arrange(ratings_df, desc(movieId))

  if(debug) {
    print("DEBUG - df sorted by id:")
    print(head(ratings_df))
  }

  return(ratings_df)
}
