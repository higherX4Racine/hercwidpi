# Copyright (C) 2025 by Higher Expectations for Racine County

test_that("specifications are correctly defined", {
  expect_equal(names(SPEC_FOR_HS_COMPLETION),
               c("SCHOOL_YEAR",
                 "AGENCY_TYPE",
                 "CESA",
                 "COUNTY",
                 "DISTRICT_CODE",
                 "SCHOOL_CODE",
                 "GRADE_GROUP",
                 "DISTRICT_NAME",
                 "SCHOOL_NAME",
                 "GROUP_BY",
                 "GROUP_BY_VALUE",
                 "STUDENT_COUNT"))
    expect_equal(names(SPEC_FOR_PUBLIC_HS_COMPLETION),
                 c("CHARTER_IND",
                   "COHORT",
                   "COMPLETION_STATUS",
                   "TIMEFRAME",
                   "COHORT_COUNT"))
    expect_equal(names(SPEC_FOR_PRIVATE_HS_COMPLETION),
                 c("COUNTY_CODE",
                   "CITY",
                   "CHOICE_IND",
                   "LOW_GRADE",
                   "HIGH_GRADE"))

})
