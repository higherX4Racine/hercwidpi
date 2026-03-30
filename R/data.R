## Copyright (C) 2026 by Higher Expectations for Racine County

#' Column specification for data about districts and school buildings
#'
#' @format ## `SPEC_FOR_AGENCY_INFO`
#' A list of 25 elements
#' \describe{
#'   \item{SCHOOL_YEAR}{`<chr>` the school year, in YYYY-YY format}
#'   \item{CESA}{`<chr>` which CESA, if any, the school belongs to}
#'   \item{COUNTY_CODE}{`<int>` A non-FIPS ID number for the county}
#'   \item{COUNTY_NAME}{`<chr>` The name of the county}
#'   \item{ATHLETIC_CONFERENCE_CODE}{`<int>` a unique identifier for the agency's conference}
#'   \item{ATHLETIC_CONFERENCE_NAME}{`<chr>` the name of the agency's conference}
#'   \item{WTCS_CODE}{`<chr>` a two-letter code that I know nothing about}
#'   \item{LOCALE_CODE}{`<int>` a two-digit code that I know nothing about}
#'   \item{LOCALE_NAME}{`<chr>`a geographic categorization like "Urban" or "Rural"}
#'   \item{LATITUDE}{`<dbl>` distance from the equator}
#'   \item{LONGITUDE}{`<dbl>` distance from Greenwich, England}
#'   \item{FULL_NCES_CODE}{`<chr>` a thirteen-digit, FIPS-like code}
#'   \item{DISTRICT_CODE}{`<chr>` the four-number code for each district, or "\[Statewide\]"}
#'   \item{SCHOOL_CODE}{`<chr>` the six-digit code for a school, or "\[Districtwide\]"}
#'   \item{DISTRICT_NAME}{`<chr>` a human-readable name for a district. Not consistent across years}
#'   \item{AGENCY_TYPE}{`<chr>` helps distinguish between district-run and independent charter schools}
#'   \item{SCHOOL_NAME}{`<chr>` a human-readable name for a school. Not consistent across years}
#'   \item{GRADE_GROUP}{`<chr>` elementary, middle, high, k-12, etc.}
#'   \item{LOW_GRADE}{`<chr>` the earliest grade in this school or district}
#'   \item{HIGH_GRADE}{`<chr>` the latest grade in this school or district}
#'   \item{SCHOOL_SIZE}{`<chr>` qualitative, from Tiny to Large, including Unknown}
#'   \item{CHARTER_IND}{`<chr>` "No" or "Yes"}
#'   \item{VIRTUAL_SCH_IND}{`<chr>` "No" or "Yes"}
#'   \item{TITLE_1A_PROGRAM_CODE}{`<chr>` a 3- or 4-character code about Title 1 status}
#'   \item{TITLE_1A_PROGRAM_NAME}{`<chr>` a human-readable description of Title 1 status}
#' }
#' @source <https://dpi.wi.gov/wisedash/public/download-files?field_wisedash_upload_type_value=Agency>
"SPEC_FOR_AGENCY_INFO"

#' Column specification for data about performance on the Forward Exam
#'
#' @format ## `SPEC_FOR_FORWARD`
#' A list of 20 elements
#' \describe{
#'   \item{SCHOOL_YEAR}{`<chr>` the school year, in YYYY-YY format}
#'   \item{AGENCY_TYPE}{`<chr>` helps distinguish between district-run and independent charter schools}
#'   \item{CESA}{`<chr>` which CESA, if any, the school belongs to}
#'   \item{COUNTY}{`<chr>` the county that the school is located in}
#'   \item{DISTRICT_CODE}{`<chr>` the four-number code for each district, or "\[Statewide\]"}
#'   \item{SCHOOL_CODE}{`<chr>` the six-digit code for a school, or "\[Districtwide\]"}
#'   \item{GRADE_GROUP}{`<chr>` elementary, middle, high, k-12, etc.}
#'   \item{CHARTER_IND}{`<chr>` whether or not a school is a charter}
#'   \item{DISTRICT_NAME}{`<chr>` a human-readable name for a district. Not consistent across years}
#'   \item{SCHOOL_NAME}{`<chr>` a human-readable name for a school. Not consistent across years}
#'   \item{TEST_SUBJECT}{`<chr>` language or math}
#'   \item{GRADE_LEVEL}{`<chr>` K-12}
#'   \item{TEST_RESULT}{`<chr>` bad, mediocre, acceptable, awesome}
#'   \item{TEST_RESULT_CODE}{`<chr>` one through four corresponding to `TEST_RESULT`}
#'   \item{TEST_GROUP}{`<chr>` dunno}
#'   \item{GROUP_BY}{`<chr>` demographic categories like race or gender}
#'   \item{GROUP_BY_VALUE}{`<chr>` demographic groups like Asian or Trans}
#'   \item{STUDENT_COUNT}{`<int>` the number of students with this test result}
#'   \item{GROUP_COUNT}{`<int>` The number of students in this demographic category}
#'   \item{FORWARD_AVERAGE_SCALE_SCORE}{`<dbl>` the mean Forward score in this group}
#' }
#' @source <https://dpi.wi.gov/wisedash/download-files/type?field_wisedash_upload_type_value=Forward>
"SPEC_FOR_FORWARD"

#' Column specification for data about High School Completion
#'
#' @format ## SPEC_FOR_HS_COMPLETION
#' A list of 17 elements
#' \describe{
#'   \item{SCHOOL_YEAR}{`<chr>` the school year, in YYYY-YY format}
#'   \item{AGENCY_TYPE}{`<chr>` helps distinguish between district-run and independent charter schools}
#'   \item{CESA}{`<chr>` which CESA, if any, the school belongs to}
#'   \item{COUNTY}{`<chr>` the county that the school is located in}
#'   \item{DISTRICT_CODE}{`<chr>` the four-number code for each district, or "\[Statewide\]"}
#'   \item{SCHOOL_CODE}{`<chr>` the six-digit code for a school, or "\[Districtwide\]"}
#'   \item{GRADE_GROUP}{`<chr>` elementary, middle, high, k-12, etc.}
#'   \item{DISTRICT_NAME}{`<chr>` a human-readable name for a district. Not consistent across years}
#'   \item{SCHOOL_NAME}{`<chr>` a human-readable name for a school. Not consistent across years}
#'   \item{GROUP_BY}{`<chr>` demographic categories like race or gender}
#'   \item{GROUP_BY_VALUE}{`<chr>` demographic groups like Asian or Trans}
#'   \item{STUDENT_COUNT}{`<int>` the number of students who completed high school}
#' }
#' @source <https://dpi.wi.gov/wisedash/download-files/type?field_wisedash_upload_type_value=hs-completion>
"SPEC_FOR_HS_COMPLETION"

#' A specification for columns found only in reports about completing public high school.
#'
#' @format ## SPEC_FOR_PUBLIC_HS_COMPLETION
#' A list of 5 elements
#' \describe{
#'   \item{CHARTER_IND}{`<chr>` whether or not a school is a charter}
#'   \item{COHORT}{`<int>` expected graduation year, e.g. 2010 for the 2009-10 school year}
#'   \item{COMPLETION_STATUS}{`<chr>` graduated normally, graduated with HSED, continuing, not}
#'   \item{TIMEFRAME}{`<chr>` whether it is the 4-, 5-, or 6-year rate, etc.}
#'   \item{COHORT_COUNT}{`<int>` the number of students who could have completed high school}
#' }
#' @source <https://dpi.wi.gov/wisedash/download-files/type?field_wisedash_upload_type_value=hs-completion>
"SPEC_FOR_PUBLIC_HS_COMPLETION"

#' Column specification for data about Completion at Private High Schools
#'
#' @format ## SPEC_FOR_PRIVATE_HS_COMPLETION
#' A list of 5 elements
#' \describe{
#'   \item{COUNTY_CODE}{`<chr>`}
#'   \item{CITY}{`<chr>`}
#'   \item{CHOICE_IND}{`<chr>`}
#'   \item{LOW_GRADE}{`<chr>`}
#'   \item{HIGH_GRADE}{`<chr>`}
#' }
#' @source <https://dpi.wi.gov/wisedash/download-files/type?field_wisedash_upload_type_value=hs-completion-private-school>
"SPEC_FOR_PRIVATE_HS_COMPLETION"

#' Column specification for data about Post-secondary Enrollment
#'
#' @format ## SPEC_FOR_PS_ENROLLMENT
#' A list of 18 elements
#' \describe{
#'   \item{SCHOOL_YEAR}{`<chr>` the school year, in YYYY-YY format}
#'   \item{AGENCY_TYPE}{`<chr>` helps distinguish between district-run and independent charter schools}
#'   \item{CHARTER_IND}{`<chr>` whether or not a school is a charter}
#'   \item{CESA}{`<chr>` which CESA, if any, the school belongs to}
#'   \item{COUNTY}{`<chr>` the county that the school is located in}
#'   \item{DISTRICT_CODE}{`<chr>` the four-number code for each district, or "\[Statewide\]"}
#'   \item{SCHOOL_CODE}{`<chr>` the six-digit code for a school, or "\[Districtwide\]"}
#'   \item{GRADE_GROUP}{`<chr>` elementary, middle, high, k-12, etc.}
#'   \item{DISTRICT_NAME}{`<chr>` a human-readable name for a district. Not consistent across years}
#'   \item{SCHOOL_NAME}{`<chr>` a human-readable name for a school. Not consistent across years}
#'   \item{INITIAL_ENROLLMENT}{`<chr>` the time lag between graduation and enrollment}
#'   \item{INSTITUTION_LOCATION}{`<chr>` in-state or out-of-state}
#'   \item{INSTITUTION_LEVEL}{`<chr>` 2-year or 4-year}
#'   \item{INSTITUTION_TYPE}{`<chr>` public or private}
#'   \item{GROUP_BY}{`<chr>` demographic categories like race or gender}
#'   \item{GROUP_BY_VALUE}{`<chr>` demographic groups like Asian or Trans}
#'   \item{GROUP_COUNT}{`<int>` the number of students who could have enrolled in postsecondary education}
#'   \item{STUDENT_COUNT}{`<int>` the number of students who enrolled in postsecondary education}
#' }
#' @source <https://dpi.wi.gov/wisedash/download-files/type?field_wisedash_upload_type_value=Postsecondary>
"SPEC_FOR_PS_ENROLLMENT"
