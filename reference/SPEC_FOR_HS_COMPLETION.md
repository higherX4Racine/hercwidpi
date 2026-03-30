# Column specification for data about High School Completion

Column specification for data about High School Completion

## Usage

``` r
SPEC_FOR_HS_COMPLETION
```

## Format

### SPEC_FOR_HS_COMPLETION

A list of 17 elements

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

- DISTRICT_NAME:

  `<chr>` a human-readable name for a district. Not consistent across
  years

- SCHOOL_NAME:

  `<chr>` a human-readable name for a school. Not consistent across
  years

- GROUP_BY:

  `<chr>` demographic categories like race or gender

- GROUP_BY_VALUE:

  `<chr>` demographic groups like Asian or Trans

- STUDENT_COUNT:

  `<int>` the number of students who completed high school

## Source

<https://dpi.wi.gov/wisedash/download-files/type?field_wisedash_upload_type_value=hs-completion>
