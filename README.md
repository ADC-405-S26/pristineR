
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pristineR

<!-- badges: start -->

<!-- badges: end -->

`pristineR` is an R package designed to simplify common data-cleaning
and summarization tasks through safer, user-friendly helper functions.

The package includes tools for parsing inconsistent date formats,
generating summary statistics, and cleaning messy column names

## Installation

You can install the development version of pristineR from
[GitHub](https://github.com/) with:

``` r
#install.packages("remotes")
#install.packages("devtools")
devtools::install_github("ADC-405-S26/pristineR")
```

## Load the Package

``` r
library(pristineR)
```

## Example Dataset

The package contains an example dataset called `messy_survey`.

``` r
messy_survey
#>    Student.Name Exam.Score. Submission.Date
#> 1     Alex Jenk          95      2024-01-01
#> 2   Bob Johnson          88      01/02/2024
#> 3 Charles Swift          NA    March 5 2024
#> 4    Daisy Slim          76      2024/04/10
#> 5      Eve Trop          91      05-15-2024
```

## Clean Column Names

The `clean_names()` function converts messy column names into snake_case
format.

``` r
cleaned_data <- clean_names(messy_survey)

names(cleaned_data)
#> [1] "student_name"    "exam_score"      "submission_date"
```

## Parse Dates

The `safe_date_parse()` function safely parses mixed-format dates into
standard Date objects.

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

## Generate Summary Statistics

The `quick_summary()` function generates common summary statistics for
selected numeric columns.

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

## Package Functions

`pristineR` currently includes:

- `safe_date_parse()`
- `quick_summary()`
- `clean_names()`
