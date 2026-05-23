## code to prepare `messy_survey_code` dataset goes here

messy_survey <- data.frame(
  "Student Name" = c("Alex Jenk","Bob Johnson","Charles Swift","Daisy Slim",
                     "Eve Trop"),

  "Exam.Score%" = c(95,88,NA,76,91),

  "Submission Date" = c(
    "2024-01-01",
    "01/02/2024",
    "March 5 2024",
    "2024/04/10",
    "05-15-2024"
  )
)

usethis::use_data(messy_survey_code, overwrite = TRUE)
