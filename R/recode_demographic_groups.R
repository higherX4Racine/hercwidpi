## Copyright (C) 2026 by Higher Expectations for Racine County

#' Convert identity-related text columns to factors in order to save memory
#'
#' @param .wisedata `<obj>` data from [read_wisedash_public()]
#'
#' @returns `<obj>` the same data but stored more efficiently
#' @export
recode_demographic_groups <- function(.wisedata) {
    .wisedata |>
        dplyr::mutate(
            dplyr::across(tidyselect::any_of(c("GROUP_BY",
                                               "GROUP_BY_VALUE")),
                          recode_text_to_factor)
        )
}
