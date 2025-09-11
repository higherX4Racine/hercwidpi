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
                         c(hercwidpi::SPEC_FOR_HS_COMPLETION,
                           hercwidpi::SPEC_FOR_PUBLIC_HS_COMPLETION))
}

.is_public <- function(.hs_completion_data){
    return(
        length(intersect(names(.hs_completion_data),
                         names(hercwidpi::SPEC_FOR_PUBLIC_HS_COMPLETION)))
        > 0
    )
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
                         c(hercwidpi::SPEC_FOR_HS_COMPLETION,
                           hercwidpi::SPEC_FOR_PRIVATE_HS_COMPLETION))
}

.is_private <- function(.hs_completion_data){
    return(
        length(intersect(names(.hs_completion_data),
                         names(hercwidpi::SPEC_FOR_PRIVATE_HS_COMPLETION)))
        > 0
    )
}

#' Convert raw data read from WISEDash Public files into a StriveTogether-friendly format
#'
#' @param .DATA a data frame in the format returned by [read_wisedash_public()]
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]> *&lt;chr&gt;* grouping fields for computing graduate counts and completion rates.
#'
#' @return a tibble with at `length(...) + 3` columns:
#' \describe{
#'   \item{...}{the grouping variables specified by `...`}
#'   \item{Students}{*&lt;int&gt;* the number of students who could have graduated by the end of the school year}
#'   \item{Graduates}{*&lt;int&gt;* the number of students who received a high school credential by the end of the school year}
#'   \item{Completion Rate}{*&lt;int&gt;* the number of students who received a high school credential by the end of the school year}
#' }
#' @export
#' @seealso [read_wisedash_public()]
wrangle_hs_completion <- function(.DATA, ...) {

    .groups <- c(...)

    .tmp <- .DATA |>
        dplyr::filter(
            stringr::str_detect(.data$COMPLETION_STATUS,
                                stringr::regex("^Completed",
                                               ignore_case = TRUE))
        ) |>
        dplyr::summarize(
            Students = dplyr::first(.data$COHORT_COUNT),
            Graduates = sum(.data$STUDENT_COUNT, na.rm = TRUE),
            .by = tidyselect::all_of(union(.groups,
                                           c("DISTRICT_CODE", "SCHOOL_CODE")))
        )

    if (!("SCHOOL_CODE" %in% .groups)) {
        .tmp <- wrangle_redactions(.tmp,
                                   .groups,
                                   c("Students", "Graduates"))
    }
    .tmp |>
        dplyr::summarize(
            dplyr::across(c("Students", "Graduates"),
                          \(.)sum(., na.rm = TRUE)),
            `Completion Rate` = .data$Graduates / .data$Students,
            .by = tidyselect::all_of(.groups)
        )
}
