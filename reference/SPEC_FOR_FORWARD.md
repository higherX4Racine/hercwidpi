# Column specification for data about performance on the Forward Exam

Column specification for data about performance on the Forward Exam

## Usage

``` r
SPEC_FOR_FORWARD
```

## Format

### `SPEC_FOR_FORWARD`

A list of 20 elements

- SCHOOL_YEAR:

  `<chr>` the school year, in YYYY-YY format

- AGENCY_TYPE:

  `<chr>` helps distinguish between district-run and independent charter
  schools

- CESA:

  `<chr>` which CESA, if any, the school belongs to

- COUNTY:

  `<chr>` the county that the school is located in

- DISTRICT_CODE:

  `<chr>` the four-number code for each district, or "\[Statewide\]"

- SCHOOL_CODE:

  `<chr>` the six-digit code for a school, or "\[Districtwide\]"

- GRADE_GROUP:

  `<chr>` elementary, middle, high, k-12, etc.

- CHARTER_IND:

  `<chr>` whether or not a school is a charter

- DISTRICT_NAME:

  `<chr>` a human-readable name for a district. Not consistent across
  years

- SCHOOL_NAME:

  `<chr>` a human-readable name for a school. Not consistent across
  years

- TEST_SUBJECT:

  `<chr>` language or math

- GRADE_LEVEL:

  `<chr>` K-12

- TEST_RESULT:

  `<chr>` bad, mediocre, acceptable, awesome

- TEST_RESULT_CODE:

  `<chr>` one through four corresponding to `TEST_RESULT`

- TEST_GROUP:

  `<chr>` dunno

- GROUP_BY:

  `<chr>` demographic categories like race or gender

- GROUP_BY_VALUE:

  `<chr>` demographic groups like Asian or Trans

- STUDENT_COUNT:

  `<int>` the number of students with this test result

- GROUP_COUNT:

  `<int>` The number of students in this demographic category

- FORWARD_AVERAGE_SCALE_SCORE:

  `<dbl>` the mean Forward score in this group

## Source

<https://dpi.wi.gov/wisedash/download-files/type?field_wisedash_upload_type_value=Forward>
