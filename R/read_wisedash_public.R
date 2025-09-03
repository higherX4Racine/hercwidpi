#' Import data from WISEDash Public into a tidy format
#'
#' @param .files paths to csv files that contain data from WISEDash public
#' @param .spec a list of column specifications for [readr::read_csv()]
#'
#' @return a data frame with some format determined by `.spec`
#' @export
read_wisedash_public <- function(.files, .spec){
    .files |>
        purrr::map(
            ~ readr::read_csv(
                .,
                col_types = .spec,
                na = c("", "*")
            )
        ) |>
        purrr::list_rbind()
}
