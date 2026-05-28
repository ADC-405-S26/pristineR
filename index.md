# pristineR

`pristineR` is an R package designed to simplify common data-cleaning
and summarization tasks through safer, user-friendly helper functions.

The package includes tools for parsing inconsistent date formats,
generating summary statistics, and cleaning messy column names.

## Why pristineR?

Many real-world datasets contain inconsistent date formats, messy column
names, and missing values that require repetitive cleaning before
analysis can begin.

`pristineR` was created to simplify these common preprocessing tasks
through lightweight helper functions that are easy to use, well
documented, and designed to fail safely when given invalid inputs.

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

The dataset intentionally contains inconsistent column names, mixed date
formats, and missing values.

## Clean Column Names

Datasets imported from spreadsheets or surveys often contain spaces,
punctuation, or inconsistent capitalization in column names.

The
[`clean_names()`](https://adc-405-s26.github.io/pristineR/reference/clean_names.md)
function converts messy column names into snake_case format.

``` r

names(messy_survey)
#> [1] "Student.Name"    "Exam.Score."     "Submission.Date"

cleaned_data <- clean_names(messy_survey)

names(cleaned_data)
#> [1] "student_name"    "exam_score"      "submission_date"
```

## Parse Dates

Datasets frequently contain dates stored in multiple formats. The
[`safe_date_parse()`](https://adc-405-s26.github.io/pristineR/reference/safe_date_parse.md)
function safely converts these valuesinto standard Date objects.

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

## Handling Invalid Dates

If a date cannot be parsed,
[`safe_date_parse()`](https://adc-405-s26.github.io/pristineR/reference/safe_date_parse.md)
returns `NA` and produces a warning message instead of stopping
execution completely.

``` r

safe_date_parse(c("2024-01-01", "bad-date"))
#> Warning in safe_date_parse(c("2024-01-01", "bad-date")): 1 date(s) could not be
#> parsed.
#> [1] "2024-01-01" NA
```

## Generate Summary Statistics

The
[`quick_summary()`](https://adc-405-s26.github.io/pristineR/reference/quick_summary.md)
function generates common summary statistics for selected numeric
columns.

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

The summary includes mean, standard deviation, minimum, maximum, and
missing value counts.

## Function Parameters

- `safe_date_parse(x)`
  - `x`: a character vector containing date values
- `quick_summary(data, columns)`
  - `data`: a data frame
  - `columns`: character vector of numeric columns to summarize
- `clean_names(data)`
  - `data`: a data frame with column names to clean

## Additional Example

`pristineR` can also be used with other messy datasets.

``` r

example_data <- data.frame(
  "Customer Name" = c("Alice", "Bob"),
  "Purchase.Date" = c("2024-01-01", "01/15/2024"),
  "Total Sales $" = c(120, 95)
)

example_data <- clean_names(example_data)

example_data$purchase_date <-
  safe_date_parse(example_data$purchase_date)

example_data
#>   customer_name purchase_date total_sales
#> 1         Alice    2024-01-01         120
#> 2           Bob    2024-01-15          95
```

## Package Functions

`pristineR` currently includes:

- [`safe_date_parse()`](https://adc-405-s26.github.io/pristineR/reference/safe_date_parse.md)
- [`quick_summary()`](https://adc-405-s26.github.io/pristineR/reference/quick_summary.md)
- [`clean_names()`](https://adc-405-s26.github.io/pristineR/reference/clean_names.md)
