## Copyright (C) 2026 by Higher Expectations for Racine County

if (!exists("RAW_AGENCIES")) {
    RAW_AGENCIES <- "Iterations" |>
        hiRx::input_path("WISEDash", "agency.rds") |>
        readRDS()
}

ATHLETIC_CONFERENCES <- RAW_AGENCIES |>
    dplyr::mutate(
        dplyr::across("ATHLETIC_CONFERENCE_CODE",
                      as.integer)
    ) |>
    latest_factor_specification(
        "ATHLETIC_CONFERENCE",
        .default_code = 0L,
        .default_name = "Not Applicable"
    )

usethis::use_data(ATHLETIC_CONFERENCES, overwrite = TRUE)

pillar::glimpse(ATHLETIC_CONFERENCES)
