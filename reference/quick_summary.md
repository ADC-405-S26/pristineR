# Quick Summary Statistics

Generates common summary statistics for selected numeric columns in a
data frame.

## Usage

``` r
quick_summary(data, columns)
```

## Arguments

- data:

  A data frame.

- columns:

  A character vector of column names to summarize.

## Value

A tibble containing summary statistics including mean, standard
deviation, minimum, maximum, and missing value counts.

## Examples

``` r
quick_summary(mtcars, c("mpg", "hp"))
#> # A tibble: 2 × 6
#>   variable  mean    sd   min   max missing_n
#>   <chr>    <dbl> <dbl> <dbl> <dbl>     <int>
#> 1 mpg       20.1  6.03  10.4  33.9         0
#> 2 hp       147.  68.6   52   335           0
```
