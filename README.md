
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pristineR

<!-- badges: start -->

<!-- badges: end -->

`pristineR` is an R package designed to simplify common data-cleaning
and summarization tasks through safer, user-friendly helper functions.

The package includes tools for parsing inconsistent date formats,
generating summary statistics, and cleaning messy column names

## Installation

You can install the development version of `pristineR` from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("ADC-405-S26/pristineR")
#> Warning: `install_github()` was deprecated in devtools 2.5.0.
#> ℹ Please use pak::pak("user/repo") instead.
#> This warning is displayed once per session.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.
#> Using GitHub PAT from the git credential store.
#> Downloading GitHub repo ADC-405-S26/pristineR@HEAD
#> 
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#> * checking for file ‘/tmp/RtmpdRxx8c/remotes3436ffa3dc3/ADC-405-S26-pristineR-ec5a6af/DESCRIPTION’ ... OK
#> * preparing ‘pristineR’:
#> * checking DESCRIPTION meta-information ... OK
#> * checking for LF line-endings in source and make files and shell scripts
#> * checking for empty or unneeded directories
#>   NB: this package now depends on R (>= 4.1.0)
#>   WARNING: Added dependency on R >= 4.1.0 because package code uses the
#>   pipe |> or function shorthand \(...) syntax added in R 4.1.0.
#>   File(s) using such syntax:
#>     ‘clean_names.R’
#> * building ‘pristineR_0.0.0.9000.tar.gz’
#> Warning: invalid uid value replaced by that for user 'nobody'
#> Installing package into '/tmp/RtmpMhlj4q/temp_libpath18233f8d61b'
#> (as 'lib' is unspecified)
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
