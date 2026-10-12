## Copyright (C) 2026 by Higher Expectations for Racine County

recode_text_to_factor <- function(.text_column) {
    .kwargs <- hercwidpi::FACTOR_LEVELS[[dplyr::cur_column()]]
    dplyr::recode_values |>
        rlang::exec(
            x = .text_column,
            !!!.kwargs
        ) |>
        factor(
            levels = unique(.kwargs$to)
        )
}

text_to_factor <- function(.text_column) {
    rlang::exec(
        factor,
        x = .text_column,
        !!!hercwidpi::FACTOR_LEVELS[[dplyr::cur_column()]]
    )
}

tabulate_occurrences <- function(.wisedata, ...) {

    .wisedata |>
        dplyr::mutate(
            Year = spring_year(.data$SCHOOL_YEAR)
        ) |>
        dplyr::summarize(
            dplyr::across("Year",
                          list(First = min, Last = max),
                          .names = "{.fn}"),
            .by = tidyselect::any_of(c(...))
        ) |>
        dplyr::arrange(
            dplyr::across(tidyselect::any_of(c(...)))
        )
}

latest_factor_specification <- function(.wisedata, .prefix,
                                        .default_code = 0,
                                        .default_name = "") {
    .code <- paste0(.prefix, "_CODE")
    .name <- paste0(.prefix, "_NAME")

    .wisedata |>
        dplyr::mutate(
            "{.code}" := dplyr::coalesce(.data[[.code]],
                                         .default_code),
            "{.name}" := dplyr::coalesce(.data[[.name]],
                                         .default_name)
        ) |>
        tabulate_occurrences(
            .code,
            .name
        ) |>
        dplyr::slice_max(
            order_by = .data$Last,
            n = 1,
            by = tidyselect::all_of(.code),
            with_ties = FALSE
        ) |>
        dplyr::select(
            levels = tidyselect::all_of(.code),
            labels = tidyselect::all_of(.name)
        ) |>
        dplyr::arrange(
            .data$levels,
            .data$labels
        ) |>
        dplyr::distinct()
}

