safe_date_parse <- function(x) {

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
