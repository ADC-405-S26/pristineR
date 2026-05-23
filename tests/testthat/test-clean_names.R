test_that("clean_names converts names to lowercase", {

  df <- data.frame("Student Name" = 1)

  cleaned <- clean_names(df)

  expect_equal(names(cleaned), "student_name")
})

test_that("clean_names removes special characters", {

  df <- data.frame("Exam.Score%" = 1)

  cleaned <- clean_names(df)

  expect_equal(names(cleaned), "exam_score")
})

test_that("clean_names removes repeated underscores", {

  df <- data.frame("Final---Grade" = 1)

  cleaned <- clean_names(df)

  expect_equal(names(cleaned), "final_grade")
})
