## Copyright (C) 2026 by Higher Expectations for Racine County

BIG_TABLES <- tibble::tribble(
    ~ Path,               ~ Pattern,                                  ~ Loader,         ~ Name,
    "Agency Information", "agency_certified_\\d{4}-\\d{2}\\.csv",     load_agency_info, "agency.rds",
    "Enrollment",         "enrollment_certified_\\d{4}-\\d{2}\\.csv", load_enrollment,  "enrollment.rds",
    "Forward Exam",       "forward_certified_\\d{4}-\\d{2}\\.csv",    load_forward,     "forward.rds"
)

#' Process downloaded tables from single years into large multi-year tables
#'
#' @param .downloads_folder `<chr>` the folder that contains downloaded annual tables
#' @param .tables_folder `<chr>` the folder to save the multi-year tables in
#'
#' @export
update_big_tables <- function(.downloads_folder,
                              .tables_folder) {

    .helper <- function(Path, Pattern, Loader, Name) {
        .downloads_folder |>
            file.path(
                Path
            ) |>
            dir(
                pattern = Pattern,
                full.names = TRUE
            ) |>
            Loader() |>
            rectify_agency_identities() |>
            saveRDS(
                file.path(.tables_folder,
                          Name)
            )
    }

    purrr::pwalk(BIG_TABLES, .helper)
}
