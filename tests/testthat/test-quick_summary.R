test_that("quick_summary returns a tibble", {

  result <- quick_summary(mtcars, c("mpg"))

  expect_s3_class(result, "tbl_df")
})

test_that("quick_summary calculates mean correctly", {

  result <- quick_summary(mtcars, c("mpg"))

  expect_equal(
    unname(round(result$mean, 2)),
    round(mean(mtcars$mpg), 2)
  )
})

test_that("quick_summary includes missing value counts", {

  test_data <- data.frame(x = c(1, 2, NA))

  result <- quick_summary(test_data, c("x"))

  expect_equal(
    unname(result$missing_n),
    1
  )
})
