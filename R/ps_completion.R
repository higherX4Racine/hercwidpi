## Copyright (C) 2025 by Higher Expectations for Racine County

#' Syntactic sugar for loading reports about enrollment after high school completion.
#'
#' @inheritParams read_wisedash_public
#'
#' @returns a data frame with 20 columns, as described by [SPEC_FOR_PS_ENROLLMENT]
#' @export
#' @seealso [read_wisedash_public()]
#' @seealso [SPEC_FOR_PS_ENROLLMENT]
load_ps_enrollment <- function(.files) {
    read_wisedash_public(.files, hercwidpi::SPEC_FOR_PS_ENROLLMENT)
}

#' Summarize post-secondary enrollment information
#'
#' @param .ps_enrollment_data a data frame with columns from [`SPEC_FOR_PS_ENROLLMENT`]
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]> *&lt;chr&gt;* grouping fields for computing post-secondary enrollment counts and rates
#'
#' @returns a data frame with `length(...) + 6 columns`
#' \describe{
#'   \item{...}{each grouping field}
#'   \item{Students}{*&lt;int&gt;* the total number of students in the group}
#'   \item{Score}{*&lt;dbl&gt;* the mean scale score of the group's students}
#'   \item{Tested}{*&lt;int&gt;* the number of students in the group who took the test}
#'   \item{Proficient}{*&lt;int&gt;* the number of students who were tested and achieved proficiency}
#'   \item{Testing Rate}{*&lt;dbl&gt;* the proportion of students in the group who took the test}
#'   \item{Proficiency Rate}{*&lt;dbl&gt;* the proportion of students who were tested and achieved proficiency}
#' }
#' @export
wrangle_ps_enrollment <- function(.DATA, ...) {

    .groups <- c(...)

    .tmp <- .DATA |>
        dplyr::summarize(
            Students = dplyr::first(.data$GROUP_COUNT),
            Enrollers = sum(.data$STUDENT_COUNT, na.rm = TRUE),
            .by = tidyselect::all_of(union(.groups,
                                           c("DISTRICT_CODE", "SCHOOL_CODE")))
        )

    if (!("SCHOOL_CODE" %in% .groups)) {
        .tmp <- wrangle_redactions(.tmp,
                                   .groups,
                                   c("Students","Enrollers"))
    }
    .tmp |>
        dplyr::summarize(
            dplyr::across(c("Students", "Enrollers"),
                          \(.)sum(., na.rm = TRUE)),
            `Enrollment Rate` = .data$Enrollers / .data$Students,
            .by = tidyselect::all_of(.groups)
        )
}
