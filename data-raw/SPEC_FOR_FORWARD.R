# Copyright (C) 2025 by Higher Expectations for Racine County

SPEC_FOR_FORWARD <- list(
    SCHOOL_YEAR = "c",
    AGENCY_TYPE = "c",
    CESA = "c",
    COUNTY = "c",
    DISTRICT_CODE = "c",
    SCHOOL_CODE = "c",
    GRADE_GROUP = "c",
    CHARTER_IND = "c",
    DISTRICT_NAME = "c",
    SCHOOL_NAME = "c",
    TEST_SUBJECT = "c",
    GRADE_LEVEL = "c",
    TEST_RESULT = "c",
    TEST_RESULT_CODE = "c",
    TEST_GROUP = "c",
    GROUP_BY = "c",
    GROUP_BY_VALUE = "c",
    STUDENT_COUNT = "i",
    PERCENT_OF_GROUP = "-",
    GROUP_COUNT = "i",
    FORWARD_AVERAGE_SCALE_SCORE = "n"
)

usethis::use_data(SPEC_FOR_FORWARD, overwrite = TRUE)
