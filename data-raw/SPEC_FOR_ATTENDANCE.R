## Copyright (C) 2026 by Higher Expectations for Racine County

SPEC_FOR_ATTENDANCE <- list(
    SCHOOL_YEAR = "c",
    AGENCY_TYPE = "c",
    CESA = "i",
    COUNTY = "c",
    DISTRICT_CODE = "c",
    SCHOOL_CODE = "c",
    GRADE_GROUP = "c",
    CHARTER_IND = "c",
    DISTRICT_NAME = "c",
    SCHOOL_NAME = "c",
    GROUP_BY = "c",
    GROUP_BY_VALUE = "c",
    STUDENT_COUNT = "i",
    POSSIBLE_DAYS_OF_ATTENDANCE = "i",
    ACTUAL_DAYS_OF_ATTENDANCE = "i",
    ATTENDANCE_RATE = "n"
)

usethis::use_data(SPEC_FOR_ATTENDANCE, overwrite = TRUE)
