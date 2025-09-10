# Copyright (C) 2025 by Higher Expectations for Racine County

SPEC_FOR_HS_COMPLETION <- list(
    SCHOOL_YEAR = "c",
    AGENCY_TYPE = "c",
    CESA = "i",
    COUNTY = "c",
    DISTRICT_CODE = "i",
    SCHOOL_CODE = "i",
    GRADE_GROUP = "c",
    DISTRICT_NAME = "c",
    SCHOOL_NAME = "c",
    GROUP_BY = "c",
    GROUP_BY_VALUE = "c",
    STUDENT_COUNT = "i"
)

usethis::use_data(SPEC_FOR_HS_COMPLETION, overwrite = TRUE)

SPEC_FOR_PUBLIC_HS_COMPLETION <- list(
    CHARTER_IND = "c",
    COHORT = "i",
    COMPLETION_STATUS = "c",
    TIMEFRAME = "c",
    COHORT_COUNT = "i"
)

usethis::use_data(SPEC_FOR_PUBLIC_HS_COMPLETION, overwrite = TRUE)

`SPEC_FOR_PRIVATE_HS_COMPLETION` <- list(
    COUNTY_CODE = "c",
    CITY = "c",
    CHOICE_IND = "c",
    LOW_GRADE = "c",
    HIGH_GRADE = "c"
)

usethis::use_data(SPEC_FOR_PRIVATE_HS_COMPLETION, overwrite = TRUE)
