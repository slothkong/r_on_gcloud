# ------------------------------------------------------------------------------
# Subroutines need to carry out the main execution routine
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
# ------------------------------------------------------------------------------

library(dplyr) # needed for `group_by()`

compute_mean_ratings <- function(ratings_df, distributed=FALSE, debug=FALSE) {
  # Compute the mean of columns in the ratings dataframe

  if(distributed) {
    mean_ratings_df <- summarize(groupBy(ratings_df, ratings_df$movieId),
      meanRating = mean(ratings_df$rating)) # group by movie and average ratings

  } else {
    mean_ratings_df <- group_by(ratings_df, movieId) %>% summarize(
      meanRating = mean(rating)) # group by movie and average ratings
  }

  if(debug) {
    print("DEBUG - df of mean ratings:")
    print(head(mean_ratings_df))
  }

  return(mean_ratings_df)
}

sort_mean_ratings <-function(mean_ratings_df, distributed=FALSE, debug=FALSE) {
  # Sort the movies in descending order accordig to their mean rating
  
  if(distributed) {
    mean_ratings_df <- arrange(mean_ratings_df,
      desc(mean_ratings_df$meanRating))
  } else {
    
    mean_ratings_df <- mean_ratings_df[order(mean_ratings_df$meanRating, decreasing = TRUE),]
  }
  
  if(debug) {
    print("DEBUG - df sorted by mean rating:")
    print(head(mean_ratings_df))
  }
  
  return(mean_ratings_df)
}

sort_movies_ids <-function(ratings_df, distributed=FALSE, debug=FALSE) {
  # Sort the movies in descending order accordig to their ID
  
  if(distributed) {
    ratings_df <- arrange(ratings_df,
                               desc(ratings_df$movieId))
  } else {
    
    ratings_df <- ratings_df[order(ratings_df$movieId, decreasing = TRUE),]
  }
  
  if(debug) {
    print("DEBUG - df sorted by id:")
    print(head(ratings_df))
  }
  
  return(ratings_df)
}

warmup_distributed_subroutine <- function(debug=TRUE) {
  # Carry out dummy operations with a distributed dataframe

  if(debug) { print("DEBUG - Running warmup distributed subroutine") }

  # Create the SparkDataFrame
  df <- as.DataFrame(faithful)

  # Use the `n` operator to count the number of times each waiting time appears
  print(head(summarize(groupBy(df, df$waiting), count = n(df$waiting))))
  ##  waiting count
  ##1      70     4
  ##2      67     1
  ##3      69     2

  # Sort the output from the aggregation to get the most common waiting times
  waiting_counts <- summarize(groupBy(df, df$waiting), count = n(df$waiting))
  print(head(arrange(waiting_counts, desc(waiting_counts$count))))
  ##   waiting count
  ##1      78    15
  ##2      83    14
  ##3      81    13
}
