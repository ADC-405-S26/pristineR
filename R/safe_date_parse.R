#' Safely Parse Dates
#'
#' Converts mixed-format date vectors into standard Date objects.
#' This function helps simplify parsing inconsistent date formats
#' commonly found in messy datasets.
#'
#'
#' @param x A character vector containing dates.
#'
#' @returns A Date vector.
#' @export
#'
#' @examples
#' safe_date_parse(c("2024-01-01", "01/02/2024"))
#'
#' @export
safe_date_parse <- function(x) {

  checkmate::assert_character(as.character(x))

  x <- as.character(x)

  parsed_dates <- lubridate::parse_date_time(x,
                                             orders = c("ymd", "mdy", "dmy", "b d Y"))

  parsed_dates <- as.Date(parsed_dates)

  failed_dates <- sum(is.na(parsed_dates))

  if (failed_dates > 0) {
    warning(failed_dates, "date(s) could not be parsed.")
  }

  return(parsed_dates)
}
