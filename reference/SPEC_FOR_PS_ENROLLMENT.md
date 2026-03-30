# Column specification for data about Post-secondary Enrollment

Column specification for data about Post-secondary Enrollment

## Usage

``` r
SPEC_FOR_PS_ENROLLMENT
```

## Format

### SPEC_FOR_PS_ENROLLMENT

A list of 18 elements

- SCHOOL_YEAR:

  `<chr>` the school year, in YYYY-YY format

- AGENCY_TYPE:

  `<chr>` helps distinguish between district-run and independent charter
  schools

- CHARTER_IND:

  `<chr>` whether or not a school is a charter

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

- INITIAL_ENROLLMENT:

  `<chr>` the time lag between graduation and enrollment

- INSTITUTION_LOCATION:

  `<chr>` in-state or out-of-state

- INSTITUTION_LEVEL:

  `<chr>` 2-year or 4-year

- INSTITUTION_TYPE:

  `<chr>` public or private

- GROUP_BY:

  `<chr>` demographic categories like race or gender

- GROUP_BY_VALUE:

  `<chr>` demographic groups like Asian or Trans

- GROUP_COUNT:

  `<int>` the number of students who could have enrolled in
  postsecondary education

- STUDENT_COUNT:

  `<int>` the number of students who enrolled in postsecondary education

## Source

<https://dpi.wi.gov/wisedash/download-files/type?field_wisedash_upload_type_value=Postsecondary>
