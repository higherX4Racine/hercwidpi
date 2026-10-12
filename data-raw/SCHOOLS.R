## Copyright (C) 2026 by Higher Expectations for Racine County

if (!exists("RAW_AGENCIES")) {
    RAW_AGENCIES <- "Iterations" |>
        hiRx::input_path("WISEDash", "agency.rds") |>
        readRDS()
}

if (!exists("RAW_ENROLLMENTS")) {
    RAW_ENROLLMENTS <- "Iterations" |>
        hiRx::input_path("WISEDash", "enrollment.rds") |>
        readRDS()
}

SCHOOLS <- list(RAW_AGENCIES,
             RAW_ENROLLMENTS) |>
    purrr::map(\(.table) .table |>
                   dplyr::select(
                       "SCHOOL_YEAR",
                       "DISTRICT_CODE",
                       "DISTRICT_NAME",
                       "SCHOOL_CODE",
                       "SCHOOL_NAME"
                   ) |>
                   dplyr::distinct()
    ) |>
    purrr::list_rbind() |>
    rectify_agency_identities() |>
    dplyr::distinct()

usethis::use_data(SCHOOLS, overwrite = TRUE)

pillar::glimpse(SCHOOLS)
