## Copyright (C) 2026 by Higher Expectations for Racine County

if (!exists("RAW_AGENCIES")) {
    RAW_AGENCIES <- "Iterations" |>
        hiRx::input_path("WISEDash", "agency.rds") |>
        readRDS()
}

TITLE_1A_PROGRAMS <- RAW_AGENCIES |>
    tabulate_occurrences(
        "TITLE_1A_PROGRAM_CODE",
        "TITLE_1A_PROGRAM_NAME"
    ) |>
    dplyr::select(
        levels = "TITLE_1A_PROGRAM_CODE",
        labels = "TITLE_1A_PROGRAM_NAME"
    ) |>
    dplyr::distinct()

usethis::use_data(TITLE_1A_PROGRAMS, overwrite = TRUE)

pillar::glimpse(TITLE_1A_PROGRAMS)
