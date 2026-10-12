## Copyright (C) 2026 by Higher Expectations for Racine County

SPEC_FOR_ABSENTEEISM <- list(
    SCHOOL_YEAR = readr::col_character(),
    AGENCY_TYPE = readr::col_character(),
    CESA = readr::col_character(),
    COUNTY = readr::col_character(),
    DISTRICT_CODE = readr::col_character(),
    SCHOOL_CODE = readr::col_character(),
    GRADE_GROUP = readr::col_character(),
    CHARTER_IND = readr::col_character(),
    DISTRICT_NAME = readr::col_character(),
    SCHOOL_NAME = readr::col_character(),
    GROUP_BY = readr::col_character(),
    GROUP_BY_VALUE = readr::col_character(),
    ABSENTEE_MEASURE = readr::col_character(),
    STUDENT_COUNT = readr::col_integer(),
    ABSENCE_COUNT = readr::col_integer(),
    ABSENCE_RATE = readr::col_number()
)

usethis::use_data(SPEC_FOR_ABSENTEEISM, overwrite = TRUE)
