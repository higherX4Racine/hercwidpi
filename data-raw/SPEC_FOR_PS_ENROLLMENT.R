## code to prepare `SPEC_FOR_PS_ENROLLMENT` dataset goes here

SPEC_FOR_PS_ENROLLMENT <- list(
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
    INITIAL_ENROLLMENT = "c",
    INSTITUTION_LOCATION = "c",
    INSTITUTION_LEVEL = "c",
    INSTITUTION_TYPE = "c",
    GROUP_BY = "c",
    GROUP_BY_VALUE = "c",
    GROUP_COUNT = "i",
    STUDENT_COUNT = "i"
)

usethis::use_data(SPEC_FOR_PS_ENROLLMENT, overwrite = TRUE)
