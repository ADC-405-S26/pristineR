quick_summary <- function(data, columns) {

  summary_table <- dplyr::tibble(
    variable = columns,
    mean = sapply(data[columns], mean, na.rm = TRUE),
    sd = sapply(data[columns], sd, na.rm = TRUE),
    min = sapply(data[columns], min, na.rm = TRUE),
    max = sapply(data[columns], max, na.rm = TRUE),
    missing_n = sapply(
      data[columns],
      function(x) sum(is.na(x))
    )
  )

  return(summary_table)
}
