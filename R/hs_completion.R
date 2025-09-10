## Copyright (C) 2025 by Higher Expectations for Racine County

#' Syntactic sugar for loading reports about completing public high school
#'
#' @inheritParams read_wisedash_public
#'
#' @returns a data frame with 17 columns, as described by the specs in "See Also"
#' @export
#' @seealso [read_wisedash_public()]
#' @seealso [SPEC_FOR_HS_COMPLETION]
#' @seealso [SPEC_FOR_PUBLIC_HS_COMPLETION]
load_public_hs_completion <- function(.files) {
    read_wisedash_public(.files,
                         c(SPEC_FOR_HS_COMPLETION,
                           SPEC_FOR_PUBLIC_HS_COMPLETION))
}

#' Syntactic sugar for loading reports about completing private high school
#'
#' @inheritParams read_wisedash_public
#'
#' @returns a data frame with 17 columns, as described by the specs in "See Also"
#' @export
#' @seealso [read_wisedash_public()]
#' @seealso [SPEC_FOR_HS_COMPLETION]
#' @seealso [SPEC_FOR_PRIVATE_HS_COMPLETION]
load_private_hs_completion <- function(.files) {
    read_wisedash_public(.files,
                         c(SPEC_FOR_HS_COMPLETION,
                           SPEC_FOR_PRIVATE_HS_COMPLETION))
}

.is_public <- function(.hs_completion_data){
    return(
        length(intersect(names(.hs_completion_data),
                         names(SPEC_FOR_PUBLIC_HS_COMPLETION)))
        > 0
    )
}

.is_private <- function(.hs_completion_data){
    return(
        length(intersect(names(.hs_completion_data),
                         names(SPEC_FOR_PRIVATE_HS_COMPLETION)))
        > 0
    )
}

#' Convert raw data read from WISEDash Public files into a StriveTogether-friendly format
#'
#' @param .hs_data a data frame in the format returned by [read_wisedash_public()]
#' @param .district optional, the code for one district, defaults to Racine Unified's code.
#'
#' @return a tibble with five columns:
#' \describe{
#'   \item{SCHOOL_YEAR}{<chr> the school year in YYYY-YYYY format}
#'   \item{Population}{<chr> a demographic category defined by StriveTogether}
#'   \item{Gender}{<chr> a gender identity recognized by StriveTogether}
#'   \item{Senior Class Size}{<int> the number of students who could have graduated by the end of the school year}
#'   \item{HS Completers}{<int> the number of students who received a high school credential by the end of the school year}
#' }
#' @export
#' @seealso [read_wisedash_public()]
wrangle_hs_completion <- function(.hs_data, .district = "4620") {
    if (.is_private(.hs_data)) {

    } else if (.is_public(.hs_data)) {

    } else {

    }
    .hs_data |>
        dplyr::filter(
            .data$TIMEFRAME == "4-Year rate",
            .data$DISTRICT_CODE == .district,
            is.na(.data$SCHOOL_CODE),
            stringr::str_detect(.data$COMPLETION_STATUS,
                                stringr::regex("^Completed",
                                               ignore_case = TRUE))
        ) |>
        dplyr::count(
            Year = .data$SCHOOL_YEAR,
            .data$Population,
            .data$Gender,
            D = .data$COHORT_COUNT,
            wt = .data$STUDENT_COUNT,
            name = "N"
        ) |>
        tidyr::pivot_longer(
            cols = c("N", "D"),
            names_to = "Role",
            values_to = "Value"
        )
}
