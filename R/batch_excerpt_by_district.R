## Copyright (C) 2025 by Higher Expectations for Racine County

#' Internal helper for extracting a single district's data from WISEDash files
#'
#' @param .input_path the location of the source files
#' @param .pattern a glob to find the files
#' @param .district_code a pattern to identify a district's data
#' @param .output_path the location to write the resulting files
#'
#' @keywords internal
batch_excerpt_by_district <- function(.input_path,
                                      .pattern,
                                      .district_code,
                                      .output_path){
    SOURCE_FILES <- dir(path = .input_path,
                        pattern = .pattern,
                        full.names = TRUE)
    SOURCE_FILES |>
        rlang::set_names(
            basename(SOURCE_FILES)
        ) |>
        purrr::map(
            \(.path) readr::read_csv(.path,
                                     col_types = "c",
                                     progress = FALSE)
        ) |>
        purrr::map(
            \(.table) dplyr::filter(.table,
                                    .data$DISTRICT_CODE == .district_code)
        ) |>
        purrr::iwalk(
            \(.table, .basename) readr::write_csv(.table,
                                                  file = file.path(.output_path,
                                                                   .basename),
                                                  quote = "needed",
                                                  na = "",
                                                  progress = FALSE)
        )
}
