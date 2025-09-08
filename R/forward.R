## Copyright (C) 2025 by Higher Expectations for Racine County

#' Helper predicate for detecting when students took the Forward exam.
#'
#' @param .result_codes *&lt;chr&gt;* usually the TEST_RESULT_CODE column from a WISEDash data set.
#'
#' @returns *&lt;lgl&gt;* `TRUE` when the `.result_codes` value contains a digit
#' @export
is_tested <- function(.result_codes) {
    !is.na(.result_codes) & stringr::str_detect(.result_codes, "\\D", negate = TRUE)
}

#' Helper predicate for detecting when students passed the Forward exam.
#'
#' @param .result_codes *&lt;chr&gt;* usually the TEST_RESULT_CODE column from a WISEDash data set.
#' @param .proficiency_threshold *&lt;int&gt;* the lowest result code that counts as success
#'
#' @returns *&lt;lgl&gt;* `TRUE` when the numeric value of `.result_codes` meets or exceeds the `.proficiency_threshold`
#' @export
is_proficient <- function(.result_codes, .proficiency_threshold = 3L) {
    .tmp <- .result_codes |>
        as.integer() |>
        suppressWarnings()
    !is.na(.tmp) & .tmp >= .proficiency_threshold
}

#' Helper for conditionally including values in a total
#'
#' @param .counts *&lt;int&gt;* counts, a la `STUDENT_COUNT`, that may be incorporated in a total
#' @param .mask *&lt;lgl&gt;* whether or not a value of `.counts` should be included
#'
#' @returns `.counts` when `.mask` is true, or zero otherwise
#'
#' @keywords internal
count_if <- function(.counts, .mask) {
    dplyr::if_else(.mask, .counts, 0L)
}

#' Syntactic sugar for loading reports about the Forward Exam.
#'
#' @inheritParams read_wisedash_public
#'
#' @returns a data frame with 20 columns, as described by [SPEC_FOR_FORWARD]
#' @export
#' @seealso [read_wisedash_public()]
#' @seealso [SPEC_FOR_FORWARD]
load_forward <- function(.files) {
    read_wisedash_public(.files, SPEC_FOR_FORWARD)
}

#' Summarize forward results
#'
#' @param .forward_data a data frame with columns from [`SPEC_FOR_FORWARD`]
#' @param .proficiency_threshold *&lt;int?&gt;* the lowest score code that counts as proficient (defaults is `3`)
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]> *&lt;chr&gt;* grouping fields for computing testing and success rates.
#'
#' @returns a data frame with `len(...) + 6 columns`
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
wrangle_forward <- function(.forward_data, ..., .proficiency_threshold = 3L) {

    .groups <- c(...)

    .tmp <- .forward_data |>
        dplyr::rename(
            Students = "GROUP_COUNT",
            Score = "FORWARD_AVERAGE_SCALE_SCORE"
        ) |>
        dplyr::mutate(
            Tested = count_if(.data$STUDENT_COUNT,
                              is_tested(.data$TEST_RESULT_CODE)),
            Proficient = count_if(.data$STUDENT_COUNT,
                                  is_proficient(.data$TEST_RESULT_CODE))
        ) |>
        dplyr::summarize(
            dplyr::across(c("Students", "Score"),
                          dplyr::first),
            dplyr::across(c("Tested", "Proficient"),
                          \(.)sum(., na.rm = TRUE)),
            .by = tidyselect::all_of(union(.groups,
                                           c("DISTRICT_CODE", "SCHOOL_CODE")))
        ) |>
        dplyr::mutate(
            Score = .data$Score * .data$Students
        )

    if (!("SCHOOL_CODE" %in% .groups)) {
        .tmp |>
            dplyr::mutate(
                Aggregation = dplyr::if_else(is.na(.data$SCHOOL_CODE),
                                             "Above",
                                             "School"),
            ) |>
            dplyr::summarize(
                dplyr::across(c("Students", "Tested", "Proficient", "Score"),
                              \(.)sum(., na.rm = TRUE)),
                .by = tidyselect::all_of(union(.groups,
                                               c("DISTRICT_CODE",
                                                 "Aggregation")))

            ) |>
            tidyr::pivot_longer(
                cols = c("Students", "Tested", "Proficient", "Score"),
                names_to = "Measure",
                values_to = "Value",
                values_drop_na = FALSE
            ) |>
            dplyr::mutate(
                Value = dplyr::coalesce(.data$Value, 0)
            ) |>
            tidyr::pivot_wider(
                names_from = "Aggregation",
                values_from = "Value",
                values_fill = 0
            ) |>
            dplyr::mutate(
                Value = purrr::map2_dbl(.data$Above, .data$School,
                                        \(.a, .s) max(.a, .s))
            ) |>
            dplyr::summarize(
                Value = sum(.data$Value),
                .by = tidyselect::all_of(c(.groups, "Measure"))
            ) |>
            tidyr::pivot_wider(
                names_from = "Measure",
                values_from = "Value",
                values_fill = 0
            ) |>
            dplyr::mutate(
                dplyr::across(c("Students", "Tested", "Proficient"),
                              as.integer)
            )
    }
    .tmp |>
        dplyr::summarize(
            dplyr::across(c("Students", "Tested", "Proficient", "Score"),
                          sum),
            `Testing Rate` = .data$Tested / .data$Students,
            `Success Rate` = .data$Proficient / .data$Tested,
            Score = .data$Score / .data$Students,
            .by = tidyselect::all_of(.groups)
        )
}
