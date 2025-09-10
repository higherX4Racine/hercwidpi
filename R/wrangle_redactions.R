#' Handle situations where missing data at the school level has propagated to missing data at the district level
#'
#' @param .DATA *&lt;tbl&gt;* data from WISEDash that includes both `SCHOOL_CODE` and `DISTRICT_CODE` fields.
#' @param .groups *&lt;chr&gt;* a vector of column names that identify grouping variables
#' @param .sum_fields  *&lt;chr&gt;* a vector of column names that identify values to aggregate
#'
#' @returns a data frame with the columns from `.groups` and `.sum_fields`
#' @export
wrangle_redactions <- function(.DATA, .groups, .sum_fields){

    .integer_fields <- .DATA |>
        dplyr::select(
            tidyselect::all_of(.sum_fields)
        ) |>
        dplyr::select(
            tidyselect::where(is.integer)
        ) |>
        names()

    .DATA |>
        dplyr::mutate(
            Aggregation = dplyr::if_else(is.na(.data$SCHOOL_CODE),
                                         "Above",
                                         "School"),
        ) |>
        dplyr::summarize(
            dplyr::across(tidyselect::all_of(.sum_fields),
                          \(.)sum(., na.rm = TRUE)),
            .by = tidyselect::all_of(union(.groups,
                                           c("DISTRICT_CODE",
                                             "Aggregation")))

        ) |>
        tidyr::pivot_longer(
            cols = tidyselect::all_of(.sum_fields),
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
            dplyr::across(tidyselect::all_of(.integer_fields),
                          as.integer)
        )
}
