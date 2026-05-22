#' Quick Summary Statistics
#'
#' Generates common summary statistics for selected numeric columns
#' in a data frame.
#'
#' @param data A data frame.
#' @param columns A character vector of column names to summarize.
#'
#' @returns A tibble containing summary statistics including mean,
#' standard deviation, minimum, maximum, and missing value counts.
#'
#' @export
#'
#' @examples
#' quick_summary(mtcars, c("mpg", "hp"))
quick_summary <- function(data, columns) {

  checkmate::assert_data_frame(data)
  checkmate::assert_character(columns)

  summary_table <- dplyr::tibble(
    variable = columns,
    mean = sapply(data[columns], mean, na.rm = TRUE),
    sd = sapply(data[columns], stats::sd, na.rm = TRUE),
    min = sapply(data[columns], min, na.rm = TRUE),
    max = sapply(data[columns], max, na.rm = TRUE),
    missing_n = sapply(
      data[columns],
      function(x) sum(is.na(x))
    )
  )

  return(summary_table)
}
