## Copyright (C) 2025 by Higher Expectations for Racine County

`SPEC_FOR_PRIVATE_HS_COMPLETION` <- list(
    SCHOOL_YEAR = readr::col_character(),
    AGENCY_TYPE = readr::col_character(),
    CESA = readr::col_character(),
    COUNTY_CODE = readr::col_character(),
    COUNTY = readr::col_character(),
    CITY = readr::col_character(),
    DISTRICT_CODE = readr::col_character(),
    SCHOOL_CODE = readr::col_character(),
    GRADE_GROUP = readr::col_character(),
    CHOICE_IND = readr::col_character(),
    DISTRICT_NAME = readr::col_character(),
    SCHOOL_NAME = readr::col_character(),
    LOW_GRADE = readr::col_character(),
    HIGH_GRADE = readr::col_double(),
    GROUP_BY = readr::col_character(),
    GROUP_BY_VALUE = readr::col_character(),
    STUDENT_COUNT = readr::col_integer()
)

usethis::use_data(SPEC_FOR_PRIVATE_HS_COMPLETION, overwrite = TRUE)
