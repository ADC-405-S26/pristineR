# Safely Parse Dates

Converts mixed-format date vectors into standard Date objects. This
function helps simplify parsing inconsistent date formats commonly found
in messy datasets.

## Usage

``` r
safe_date_parse(x)
```

## Arguments

- x:

  A character vector containing dates.

## Value

A Date vector.

## Examples

``` r
safe_date_parse(c("2024-01-01", "01/02/2024"))
#> [1] "2024-01-01" "2024-01-02"
```
