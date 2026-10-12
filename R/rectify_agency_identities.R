## Copyright (C) 2026 by Higher Expectations for Racine County

#' Create unique ids for schools while fixing inconsistencies in state coding
#'
#' WISEDash public data files use a composite key to track individual schools.
#' Each district and school has a 4-digit code.
#' District codes are unique ("0000" means "\[Statewide\]").
#' School codes are frequently reused across districts, with "0000" for "\[Districtwide\]."
#'
#' @param .wisedata `<obj>` a data frame produced by [read_wisedash_public()]
#'
#' @returns `<obj>` a new data frame with an additional column, `SCHOOL_ID`, that concatenates District and School Codes.
#' @export
rectify_agency_identities <- function(.wisedata) {
    .wisedata |>
        dplyr::mutate(
            SCHOOL_CODE = dplyr::coalesce(.data$SCHOOL_CODE,
                                          "0000"), # for District- and Statewide values
            SCHOOL_NAME = dplyr::coalesce(.data$SCHOOL_NAME,
                                          "[Districtwide]") # should only be relevant for a few early charter schools
        ) |>
        dplyr::mutate(
            SCHOOL_ID = paste0(.data$DISTRICT_CODE, .data$SCHOOL_CODE)
        )
}
