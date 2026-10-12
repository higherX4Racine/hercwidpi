## Copyright (C) 2026 by Higher Expectations for Racine County

if (!exists("RAW_AGENCIES")) {
    RAW_AGENCIES <- "Iterations" |>
        hiRx::input_path("WISEDash", "agency.rds") |>
        readRDS()
}

LOCALES <- RAW_AGENCIES |>
    dplyr::mutate(
        LOCALE_CODE = as.integer(.data$LOCALE_CODE)
    ) |>
    latest_factor_specification(
        "LOCALE",
        .default_code = 0,
        .default_name = "Undefined"
    )

usethis::use_data(LOCALES, overwrite = TRUE)

pillar::glimpse(LOCALES)
