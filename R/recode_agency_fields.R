## Copyright (C) 2026 by Higher Expectations for Racine County

.CODENAMES <- c(
    "ATHLETIC_CONFERENCE_CODE",
    "LOCALE_CODE",
    "COUNTY_CODE",
    "DISTRICT_CODE",
    "SCHOOL_CODE"
)

#' Convert agency-related text columns to factors in order to save memory
#'
#' @param .wisedata `<obj>` data from [read_wisedash_public()]
#'
#' @returns `<obj>` the same data but stored more efficiently
#' @export
recode_agency_fields <- function(.wisedata) {

    .wisedata |>
        dplyr::select(
            !tidyselect::any_of(stringr::str_replace(.CODENAMES,
                                                     "CODE",
                                                     "NAME"))
        ) |>
        dplyr::mutate(
            dplyr::across(tidyselect::any_of(c("AGENCY_TYPE",
                                               "GRADE_GROUP")),
                          recode_text_to_factor),
            dplyr::across(tidyselect::any_of(c("CESA")),
                          as.integer),
            dplyr::across(tidyselect::any_of(c("LOW_GRADE",
                                               "HIGH_GRADE")),
                          recode_grade_levels),
            dplyr::across(tidyselect::any_of(c("CHARTER_IND",
                                               "VIRTUAL_SCHOOL_IND",
                                               .CODENAMES)),
                          text_to_factor)
        ) |>
        dplyr::rename_with(
            \(.) stringr::str_remove(., "_CODE"),
            .cols = tidyselect::any_of(.CODENAMES)
        )
}


##    Column                   Type      Levels
##  1 SCHOOL_YEAR              character     21
##  2 CESA                     character     12
##  3 COUNTY_CODE              character     73
##  4 COUNTY_NAME              character     73
##  5 ATHLETIC_CONFERENCE_CODE integer       78
##  6 ATHLETIC_CONFERENCE_NAME character     78
##  7 WTCS_CODE                character     17
##  8 LOCALE_CODE              integer       21
##  9 LOCALE_NAME              character     21
## 10 LATITUDE                 double     12003
## 11 LONGITUDE                double     12165
## 12 FULL_NCES_CODE           character   2513
## 13 DISTRICT_CODE            character    508
## 15 DISTRICT_NAME            character    576
## 16 AGENCY_TYPE              character      4
## 14 SCHOOL_CODE              character    460
## 17 SCHOOL_NAME              character   3016
## 18 GRADE_GROUP              character      5
## 19 LOW_GRADE                character     16
## 20 HIGH_GRADE               character     16
## 21 SCHOOL_SIZE              character      6
## 22 CHARTER_IND              character      2
## 23 SAGE_IND                 character      3
## 24 VIRTUAL_SCH_IND          character      3
## 25 TITLE_1A_PROGRAM_CODE    character      7
## 26 TITLE_1A_PROGRAM_NAME    character      7
