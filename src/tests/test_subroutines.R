# ------------------------------------------------------------------------------
# Unittest for functions in `subroutines.R`
#
# Author: Mario Loaiciga
#         mario.lr@kaist.ac.kr
# ------------------------------------------------------------------------------

library(testthat)

source("../subroutines.R", chdir = TRUE)

test_that("compute_mean_ratings on dataframe", {

  userId = c(1, 1, 2, 2, 3)
  movieId = c(1, 2, 1, 2, 3)
  rating = c(1, 2, 1, 2, 3)

  ratings <- data.frame(userId, movieId, rating)

  movieId = c(1, 2, 3)
  meanRating = c(1, 2, 3)
  expected_result = data.frame(movieId, meanRating)

  result <- compute_mean_ratings(ratings)
  expect_equal(result, expected_result)
})

test_that("sort_mean_ratings on dataframe", {
  
  userId = c(1, 2, 3, 4, 5)
  meanRating = c(1.0, 4.0, 6.0, 7.0, 3.0)

  mean_ratings <- data.frame(userId, meanRating)
  
  userId = c(4, 3, 2, 5, 1)
  meanRating = c(7.0, 6.0, 4.0, 3.0, 1.0)
  expected_result = data.frame(userId, meanRating)
  
  resul <- sort_mean_ratings(mean_ratings)
  rownames(resul) <- NULL # reset indx
  
  expect_equal(resul, expected_result)
})

test_that("sort_movies_ids on dataframe", {
  
  userId = c(1, 2, 5, 4, 3)
  movieId = c(1, 2, 5, 4, 3)
  meanRating = c(1.0, 4.0, 6.0, 7.0, 3.0)
  
  mean_ratings <- data.frame(userId, movieId, meanRating)
  
  userId = c(5, 4, 3, 2,  1)
  movieId = c(5, 4, 3, 2,  1)
  meanRating = c(6.0, 7.0, 3.0, 4.0, 1.0)
  expected_result = data.frame(userId, movieId, meanRating)
  
  resul <- sort_movies_ids(mean_ratings)
  rownames(resul) <- NULL # reset indx
  
  expect_equal(resul, expected_result)
})