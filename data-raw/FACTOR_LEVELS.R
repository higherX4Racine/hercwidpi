## Copyright (C) 2026 by Higher Expectations for Racine County

.FUZZY_BOOLEAN <- c("Unknown", "No", "Yes")

FACTOR_LEVELS <- list(
    AGENCY_TYPE = list(
        from = c(
            "Non District Charter Schools",
            "School District",
            "Public school",
            "Public Schools-Multidistrict Charters",
            "Charter Management Organization (CMO)",
            "ICS Governance Board/Legal Entity"
        ),
        to = c(
            "Private Charter",
            "School District",
            "Public School",
            "Public Charter",
            "Private Charter",
            "Private Charter"
        ),
        default = "All"
    ),
    GRADE_GROUP = list(
        from = c(
            "Elementary School",
            "Combined Elementary/Secondary School",
            "Middle School",
            "Junior High School",
            "High School"
        ),
        to = c(
            "Elementary",
            "K-12",
            "Middle",
            "Junior High",
            "High"
        ),
        default = "All"
    ),
    CHARTER_IND = list(
        levels = .FUZZY_BOOLEAN
    ),
    SAGE_IND = list(
        from = c(NA, "No", "Yes"),
        to = .FUZZY_BOOLEAN
    ),
    VIRTUAL_SCHOOL_IND = list(
        levels = .FUZZY_BOOLEAN
    ),
    ATHLETIC_CONFERENCE_CODE = ATHLETIC_CONFERENCES,
    LOCALE_CODE = LOCALES,
    COUNTY_CODE = COUNTIES,
    DISTRICT_CODE = DISTRICTS,
    SCHOOL_CODE = SCHOOLS,
    TEST_SUBJECT = list(
        levels = c(
            "ELA",
            "Mathematics",
            "Science",
            "Social Studies",
            "Reading",
            "Writing"
        )
    ),
    TEST_GROUP = list(
        levels = c("Forward", "DLM")
    ),
    TEST_RESULT = list(
        from = c(
            "Below Basic",
            "Developing",
            "Approaching",
            "Basic",
            "Meeting",
            "Proficient",
            "Advanced",
            "No Score",
            "No Test"
        ),
        to = c(
            "Developing",
            "Developing",
            "Approaching",
            "Approaching",
            "Meeting",
            "Meeting",
            "Advanced",
            "Untested",
            "Untested"
        ),
        default = "Missing"
    ),
    GROUP_BY = list(
        from = c(
            "All Students",
            "Disability Status",
            "Economic Status",
            "EL Status",
            "ELL Status",
            "Gender",
            "Migrant Status",
            "Race/Ethnicity"
        ),
        to = c(
            "All",
            "Disability",
            "Economic Disadvantage",
            "English Learner",
            "English Learner",
            "Gender",
            "Migrant",
            "Race/Ethnicity"
        ),
        default = character()
    ),
    GROUP_BY_VALUE = list(
        from = c(
            "[Data Suppressed]",
            "Unknown",
            "All Students",
            "SwD",
            "SwoD",
            "Econ Disadv",
            "Not Econ Disadv",
            "ELL/LEP",
            "EL",
            "Eng Prof",
            "Female",
            "Non-binary",
            "Male",
            "Migrant",
            "Not Migrant",
            "Amer Indian",
            "Asian",
            "Black",
            "Hispanic",
            "Pacific Isle",
            "Two or More",
            "White"
        ),
        from = c(
            "Redacted",
            "Unknown",
            "All",
            "Yes",
            "No",
            "Yes",
            "No",
            "Yes",
            "Yes",
            "No",
            "Female",
            "Non-binary",
            "Male",
            "Yes",
            "No",
            "American Indian and Alaska Native",
            "Asian",
            "Black or African American",
            "Hispanic or Latino",
            "Native Hawaiian and Other Pacific Islander",
            "Two or More Races",
            "White"
        ),
        default = character(0)
    )
)

usethis::use_data(FACTOR_LEVELS, overwrite = TRUE)
