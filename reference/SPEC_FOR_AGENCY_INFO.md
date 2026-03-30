# Column specification for data about districts and school buildings

Column specification for data about districts and school buildings

## Usage

``` r
SPEC_FOR_AGENCY_INFO
```

## Format

### `SPEC_FOR_AGENCY_INFO`

A list of 25 elements

- SCHOOL_YEAR:

  `<chr>` the school year, in YYYY-YY format

- CESA:

  `<chr>` which CESA, if any, the school belongs to

- COUNTY_CODE:

  `<int>` A non-FIPS ID number for the county

- COUNTY_NAME:

  `<chr>` The name of the county

- ATHLETIC_CONFERENCE_CODE:

  `<int>` a unique identifier for the agency's conference

- ATHLETIC_CONFERENCE_NAME:

  `<chr>` the name of the agency's conference

- WTCS_CODE:

  `<chr>` a two-letter code that I know nothing about

- LOCALE_CODE:

  `<int>` a two-digit code that I know nothing about

- LOCALE_NAME:

  `<chr>`a geographic categorization like "Urban" or "Rural"

- LATITUDE:

  `<dbl>` distance from the equator

- LONGITUDE:

  `<dbl>` distance from Greenwich, England

- FULL_NCES_CODE:

  `<chr>` a thirteen-digit, FIPS-like code

- DISTRICT_CODE:

  `<chr>` the four-number code for each district, or "\[Statewide\]"

- SCHOOL_CODE:

  `<chr>` the six-digit code for a school, or "\[Districtwide\]"

- DISTRICT_NAME:

  `<chr>` a human-readable name for a district. Not consistent across
  years

- AGENCY_TYPE:

  `<chr>` helps distinguish between district-run and independent charter
  schools

- SCHOOL_NAME:

  `<chr>` a human-readable name for a school. Not consistent across
  years

- GRADE_GROUP:

  `<chr>` elementary, middle, high, k-12, etc.

- LOW_GRADE:

  `<chr>` the earliest grade in this school or district

- HIGH_GRADE:

  `<chr>` the latest grade in this school or district

- SCHOOL_SIZE:

  `<chr>` qualitative, from Tiny to Large, including Unknown

- CHARTER_IND:

  `<chr>` "No" or "Yes"

- VIRTUAL_SCH_IND:

  `<chr>` "No" or "Yes"

- TITLE_1A_PROGRAM_CODE:

  `<chr>` a 3- or 4-character code about Title 1 status

- TITLE_1A_PROGRAM_NAME:

  `<chr>` a human-readable description of Title 1 status

## Source

<https://dpi.wi.gov/wisedash/public/download-files?field_wisedash_upload_type_value=Agency>
