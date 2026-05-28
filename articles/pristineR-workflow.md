# Cleaning Messy Data with pristineR

## Introduction

Data cleaning is one of the most common and repetitive tasks in data
analysis workflows. Real-world datasets often contain inconsistent date
formats, messy column names, and missing values that require a lot of
the same tedious cleaning before analysis can begin.

The `pristineR` package provides functions that simplify common
data-cleaning tasks through safer and more user-friendly workflows.

This vignette demonstrates how to use:
[`clean_names()`](https://adc-405-s26.github.io/pristineR/reference/clean_names.md),
[`safe_date_parse()`](https://adc-405-s26.github.io/pristineR/reference/safe_date_parse.md),
and
[`quick_summary()`](https://adc-405-s26.github.io/pristineR/reference/quick_summary.md)
using the included `messy_survey` dataset.

## Load the Package

``` r

library(pristineR)
```

## Example Dataset

The package includes an example dataset called `messy_survey`.

``` r

messy_survey
#>    Student.Name Exam.Score. Submission.Date
#> 1     Alex Jenk          95      2024-01-01
#> 2   Bob Johnson          88      01/02/2024
#> 3 Charles Swift          NA    March 5 2024
#> 4    Daisy Slim          76      2024/04/10
#> 5      Eve Trop          91      05-15-2024
```

The dataset intentionally contains inconsistent column names, mixed date
formats, and missing values.

## Cleaning Column Names

Messy column names can make analysis more difficult. The
[`clean_names()`](https://adc-405-s26.github.io/pristineR/reference/clean_names.md)
function converts names into standardized snake_case formatting.

``` r

cleaned_data <- clean_names(messy_survey)

names(cleaned_data)
#> [1] "student_name"    "exam_score"      "submission_date"
```

## Parsing Dates

Datasets often contain dates stored in multiple formats. The
[`safe_date_parse()`](https://adc-405-s26.github.io/pristineR/reference/safe_date_parse.md)
function safely converts these dates into standard Date objects.

``` r

cleaned_data$submission_date <-
  safe_date_parse(cleaned_data$submission_date)

cleaned_data
#>    student_name exam_score submission_date
#> 1     Alex Jenk         95      2024-01-01
#> 2   Bob Johnson         88      2024-01-02
#> 3 Charles Swift         NA      2024-03-05
#> 4    Daisy Slim         76      2024-04-10
#> 5      Eve Trop         91      2024-05-15
```

## Generating Summary Statistics

The
[`quick_summary()`](https://adc-405-s26.github.io/pristineR/reference/quick_summary.md)
function generates common summary statistics for numeric variables.

``` r

quick_summary(
  cleaned_data,
  c("exam_score")
)
#> # A tibble: 1 × 6
#>   variable    mean    sd   min   max missing_n
#>   <chr>      <dbl> <dbl> <dbl> <dbl>     <int>
#> 1 exam_score  87.5  8.19    76    95         1
```

The summary includes: mean, standard deviation, minimum, maximum, and
missing value counts.

## Complete Workflow - Putting it all Together

The following example demonstrates a complete cleaning workflow using
`pristineR`.

``` r

cleaned_data <- messy_survey |>
  clean_names()

cleaned_data$submission_date <-
  safe_date_parse(cleaned_data$submission_date)

summary_table <- quick_summary(
  cleaned_data,
  c("exam_score")
)

summary_table
#> # A tibble: 1 × 6
#>   variable    mean    sd   min   max missing_n
#>   <chr>      <dbl> <dbl> <dbl> <dbl>     <int>
#> 1 exam_score  87.5  8.19    76    95         1
```

## Conclusion

The `pristineR` package simplifies several common data-cleaning tasks
that frequently arise in R workflows.

Raw datasets are often difficult to analyze immediately due to
inconsistent formatting and missing values. By combining the functions
in `pristineR`, users can quickly transform messy data into a cleaner
and more analysis-ready format.
