## Copyright (C) 2026 by Higher Expectations for Racine County

if (!exists("RAW_AGENCIES")) {
    RAW_AGENCIES <- "Iterations" |>
        hiRx::input_path("WISEDash", "agency.rds") |>
        readRDS()
}

COUNTIES <- RAW_AGENCIES |>
    dplyr::mutate(
        dplyr::across("COUNTY_CODE",
                      as.integer)
    ) |>
    latest_factor_specification(
        "COUNTY",
        .default_code = 0L,
        .default_name = "[Statewide]"
    )

usethis::use_data(COUNTIES, overwrite = TRUE)

pillar::glimpse(COUNTIES)
