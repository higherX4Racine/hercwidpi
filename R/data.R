#' Column specification for data about performance on the Forward Exam
#'
#' @format ## `SPEC_FOR_FORWARD`
#' A list of 21 elements
#' \describe{
#'   \item{SCHOOL_YEAR}{&lt;chr&gt; the school year, in YYYY-YY format}
#'   \item{AGENCY_TYPE}{&lt;chr&gt; helps distinguish between district-run and independent charter schools}
#'   \item{CESA}{&lt;chr&gt;, which CESA, if any, the school belongs to}
#'   \item{COUNTY}{&lt;chr&gt;, the county that the school is located in}
#'   \item{DISTRICT_CODE}{&lt;chr&gt; the four-number code for each district, or "\[Statewide\]"}
#'   \item{SCHOOL_CODE}{&lt;chr&gt; the six-digit code for a school, or "\[Districtwide\]"}
#'   \item{GRADE_GROUP}{&lt;chr&gt; elementary, middle, high, k-12, etc.}
#'   \item{CHARTER_IND}{&lt;chr&gt; whether or not a school is a charter}
#'   \item{DISTRICT_NAME}{&lt;chr&gt; a human-readable name for a district. Not consistent across years}
#'   \item{SCHOOL_NAME}{&lt;chr&gt; a human-readable name for a school. Not consistent across years}
#'   \item{TEST_SUBJECT}{&lt;chr&gt; language or math}
#'   \item{GRADE_LEVEL}{&lt;chr&gt; K-12}
#'   \item{TEST_RESULT}{&lt;chr&gt; bad, mediocre, acceptable, awesome}
#'   \item{TEST_RESULT_CODE}{&lt;chr&gt; one through four corresponding to `TEST_RESULT`}
#'   \item{TEST_GROUP}{&lt;chr&gt; dunno}
#'   \item{GROUP_BY}{&lt;chr&gt; demographic categories like race or gender}
#'   \item{GROUP_BY_VALUE}{&lt;chr&gt; demographic groups like Asian or Trans}
#'   \item{STUDENT_COUNT}{&lt;int&gt; the number of students with this test result}
#'   \item{PERCENT_OF_GROUP}{&lt;dbl&gt; the fraction of the group with this test result}
#'   \item{GROUP_COUNT}{&lt;int&gt; The number of students in this demographic category}
#'   \item{FORWARD_AVERAGE_SCALE_SCORE}{&lt;dbl&gt; the mean Forward score in this group}
#' }
#' @source <https://dpi.wi.gov/wisedash/download-files/type?field_wisedash_upload_type_value=Forward>
"SPEC_FOR_FORWARD"


#' Column specification for data about High School Completion
#'
#' @format ## SPEC_FOR_HS_COMPLETION
#' \describe{
#'   \item{SCHOOL_YEAR}{&lt;chr&gt; the school year, in YYYY-YY format}
#'   \item{AGENCY_TYPE}{&lt;chr&gt; helps distinguish between district-run and independent charter schools}
#'   \item{CHARTER_IND}{&lt;chr&gt; whether or not a school is a charter}
#'   \item{CESA}{&lt;chr&gt;, which CESA, if any, the school belongs to}
#'   \item{COUNTY}{&lt;chr&gt;, the county that the school is located in}
#'   \item{DISTRICT_CODE}{&lt;chr&gt; the four-number code for each district, or "\[Statewide\]"}
#'   \item{SCHOOL_CODE}{&lt;chr&gt; the six-digit code for a school, or "\[Districtwide\]"}
#'   \item{GRADE_GROUP}{&lt;chr&gt; elementary, middle, high, k-12, etc.}
#'   \item{DISTRICT_NAME}{&lt;chr&gt; a human-readable name for a district. Not consistent across years}
#'   \item{SCHOOL_NAME}{&lt;chr&gt; a human-readable name for a school. Not consistent across years}
#'   \item{COHORT}{&lt;int&gt; expected graduation year, e.g. 2010 for the 2009-10 school year}
#'   \item{COMPLETION_STATUS}{&lt;chr&gt; graduated normally, graduated with HSED, continuing, not}
#'   \item{GROUP_BY}{&lt;chr&gt; demographic categories like race or gender}
#'   \item{GROUP_BY_VALUE}{&lt;chr&gt; demographic groups like Asian or Trans}
#'   \item{TIMEFRAME}{&lt;chr&gt; whether it is the 4-, 5-, or 6-year rate, etc.}
#'   \item{COHORT_COUNT}{&lt;int&gt; the number of students who could have completed high school}
#'   \item{STUDENT_COUNT}{&lt;int&gt; the number of students who completed high school}
#' }
#' @source <https://dpi.wi.gov/wisedash/download-files/type?field_wisedash_upload_type_value=hs-completion>
"SPEC_FOR_HS_COMPLETION"

#' Column specification for data about Post-secondary Enrollment
#'
#' @format ## SPEC_FOR_PS_ENROLLMENT
#' \describe{
#'   \item{SCHOOL_YEAR}{&lt;chr&gt; the school year, in YYYY-YY format}
#'   \item{AGENCY_TYPE}{&lt;chr&gt; helps distinguish between district-run and independent charter schools}
#'   \item{CHARTER_IND}{&lt;chr&gt; whether or not a school is a charter}
#'   \item{CESA}{&lt;chr&gt;, which CESA, if any, the school belongs to}
#'   \item{COUNTY}{&lt;chr&gt;, the county that the school is located in}
#'   \item{DISTRICT_CODE}{&lt;chr&gt; the four-number code for each district, or "\[Statewide\]"}
#'   \item{SCHOOL_CODE}{&lt;chr&gt; the six-digit code for a school, or "\[Districtwide\]"}
#'   \item{GRADE_GROUP}{&lt;chr&gt; elementary, middle, high, k-12, etc.}
#'   \item{DISTRICT_NAME}{&lt;chr&gt; a human-readable name for a district. Not consistent across years}
#'   \item{SCHOOL_NAME}{&lt;chr&gt; a human-readable name for a school. Not consistent across years}
#'   \item{INITIAL_ENROLLMENT}{&lt;chr&gt; the time lag between graduation and enrollment}
#'   \item{INSTITUTION_LOCATION}{&lt;chr&gt; in-state or out-of-state}
#'   \item{INSTITUTION_LEVEL}{&lt;chr&gt; 2-year or 4-year}
#'   \item{INSTITUTION_TYPE}{&lt;chr&gt; public or private}
#'   \item{GROUP_BY}{&lt;chr&gt; demographic categories like race or gender}
#'   \item{GROUP_BY_VALUE}{&lt;chr&gt; demographic groups like Asian or Trans}
#'   \item{GROUP_COUNT}{&lt;int&gt; the number of students who could have enrolled in postsecondary education}
#'   \item{STUDENT_COUNT}{&lt;int&gt; the number of students who enrolled in postsecondary education}
#' }
#' @source <https://dpi.wi.gov/wisedash/download-files/type?field_wisedash_upload_type_value=Postsecondary>
"SPEC_FOR_PS_ENROLLMENT"
