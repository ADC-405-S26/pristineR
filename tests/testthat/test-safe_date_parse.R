test_that("safe_date_parse correctly parses dates", {

  x <- c("2024-01-01", "01/02/2024")

  result <- safe_date_parse(x)

  expect_true(all(!is.na(result)))
})

test_that("safe_date_parse returns Date objects", {

  result <- safe_date_parse("2024-01-01")

  expect_s3_class(result, "Date")
})

test_that("safe_date_parse warns on invalid dates", {

  expect_warning(
    safe_date_parse(c("bad-date")),
    "could not be parsed"
  )
})
