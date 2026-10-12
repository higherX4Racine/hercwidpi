## Copyright (C) 2026 by Higher Expectations for Racine County

# the decision rule is this: if a lookup table would be more useful with
# explanation or redefining of terms then it gets a raw data table. otherwise,
# we reconstruct its values from WISEDash data.

#' Parse agency information to create compact lookup tables for categorical data
#'
#' @param .agency_data `<obj>` a data frame made by [load_agency_info()]
#'
#' @returns `<lst>` lookup tables for things like Districts, Schools, and Counties.
#' @export
build_tables_of_agency_information <- function(.agency_data) {
    list(
        `Athletic Conference` = c(
            "ATHLETIC_CONFERENCE_CODE",
            "ATHLETIC_CONFERENCE_NAME"
        ),
        `District Detail` = c(
            "DISTRICT_CODE",
            "SCHOOL_YEAR",
            "DISTRICT_NAME",
            "CESA"
        ),
        School = c(
            "DISTRICT_CODE",
            "SCHOOL_CODE"
        ),
        `School Name` = c(
            "DISTRICT_CODE",
            "SCHOOL_CODE",
            "SCHOOL_YEAR",
            "SCHOOL_NAME",
            "FULL_NCES_CODE"
        ),
        `Title 1a Program` = c(
            "TITLE_1A_PROGRAM_CODE",
            "TITLE_1A_PROGRAM_NAME"
        ),
        County = c(
            "COUNTY_CODE",
            "COUNTY_NAME"
        ),
        Locale = c(
            "LOCALE_CODE",
            "LOCALE_NAME"
        ),
        `School Detail` = c(
            "DISTRICT_CODE",
            "SCHOOL_CODE",
            "SCHOOL_YEAR",
            "SCHOOL_SIZE",
            "LOW_GRADE",
            "HIGH_GRADE",
            "AGENCY_TYPE",
            "CHARTER_IND",
            "SAGE_IND",
            "VIRTUAL_SCH_IND",
            "TITLE_1A_PROGRAM_CODE",
            "WTCS_CODE",
            "COUNTY_CODE",
            "LOCALE_CODE",
            "LATITUDE",
            "LONGITUDE",
            "ATHLETIC_CONFERENCE_CODE"
        )
    ) |>
        purrr::map(
            \(.fields) .agency_data |>
                dplyr::select(
                    tidyselect::all_of(.fields)
                ) |>
                dplyr::distinct()
        )
}
