## Copyright (C) 2026 by Higher Expectations for Racine County

if (!exists("RAW_AGENCIES")) {
    RAW_AGENCIES <- "Iterations" |>
        hiRx::input_path("WISEDash", "agency.rds") |>
        readRDS()
}

DISTRICTS <- RAW_AGENCIES |>
    dplyr::mutate(
        dplyr::across("DISTRICT_CODE",
                      as.integer)
    ) |>
    latest_factor_specification(
        "DISTRICT",
        .default_code = 0L,
        .default_name = "[Statewide]"
    )

usethis::use_data(DISTRICTS, overwrite = TRUE)

pillar::glimpse(DISTRICTS)
