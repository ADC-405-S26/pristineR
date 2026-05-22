#' Clean Column Names
#'
#' Converts messy column names into standardized snake_case format.
#' @param data A data frame.
#'
#' @returns A data frame with cleaned column names.
#' @export
#'
#' @examples
#' clean_names(mtcars)
clean_names <- function(data) {

  checkmate::assert_data_frame(data)

  cleaned_names <- names(data) |>
    stringr::str_to_lower() |>
    stringr::str_replace_all("[^a-z0-9]", "_") |>
    stringr::str_replace_all("_+", "_") |>
    stringr::str_replace_all("^_|_$", "")

  names(data) <- cleaned_names

  return(data)
}
