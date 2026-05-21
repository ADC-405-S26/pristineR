clean_names <- function(data) {

  cleaned_names <- names(data) |>
    stringr::str_to_lower() |>
    stringr::str_replace_all("[^a-z0-9]", "_") |>
    stringr::str_replace_all("_+", "_") |>
    stringr::str_replace_all("^_|_$", "")

  names(data) <- cleaned_names

  return(data)
}
