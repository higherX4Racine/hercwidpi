## code to prepare

SPEC_FOR_AGENCY_INFO <- list(
    SCHOOL_YEAR = "c",
    CESA = "c",
    COUNTY_CODE = "c",
    COUNTY_NAME = "c",
    ATHLETIC_CONFERENCE_CODE = "i",
    ATHLETIC_CONFERENCE_NAME = "c",
    WTCS_CODE = "c",
    LOCALE_CODE = "i",
    LOCALE_NAME = "c",
    LATITUDE = "d",
    LONGITUDE = "d",
    FULL_NCES_CODE = "c",
    DISTRICT_CODE = "c",
    SCHOOL_CODE = "c",
    DISTRICT_NAME = "c",
    AGENCY_TYPE = "c",
    SCHOOL_NAME = "c",
    GRADE_GROUP = "c",
    LOW_GRADE = "c",
    HIGH_GRADE = "c",
    SCHOOL_SIZE = "c",
    CHARTER_IND = "c",
    VIRTUAL_SCH_IND = "c",
    TITLE_1A_PROGRAM_CODE = "c",
    TITLE_1A_PROGRAM_NAME = "c"
)

usethis::use_data(SPEC_FOR_AGENCY_INFO, overwrite = TRUE)
