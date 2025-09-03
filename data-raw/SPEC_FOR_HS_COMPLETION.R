# Copyright (C) 2025 by Higher Expectations for Racine County

SPEC_FOR_HS_COMPLETION <- list(
    SCHOOL_YEAR = "c",
    AGENCY_TYPE = "c",
    CHARTER_IND = "c",
    CESA = "c",
    COUNTY = "c",
    DISTRICT_CODE = "c",
    SCHOOL_CODE = "c",
    GRADE_GROUP = "c",
    DISTRICT_NAME = "c",
    SCHOOL_NAME = "c",
    COHORT = "i",
    COMPLETION_STATUS = "c",
    GROUP_BY = "c",
    GROUP_BY_VALUE = "c",
    TIMEFRAME = "c",
    COHORT_COUNT = "i",
    STUDENT_COUNT = "i"
)

usethis::use_data(SPEC_FOR_HS_COMPLETION, overwrite = TRUE)
