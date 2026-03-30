# A specification for columns found only in reports about completing public high school.

A specification for columns found only in reports about completing
public high school.

## Usage

``` r
SPEC_FOR_PUBLIC_HS_COMPLETION
```

## Format

### SPEC_FOR_PUBLIC_HS_COMPLETION

A list of 5 elements

- CHARTER_IND:

  `<chr>` whether or not a school is a charter

- COHORT:

  `<int>` expected graduation year, e.g. 2010 for the 2009-10 school
  year

- COMPLETION_STATUS:

  `<chr>` graduated normally, graduated with HSED, continuing, not

- TIMEFRAME:

  `<chr>` whether it is the 4-, 5-, or 6-year rate, etc.

- COHORT_COUNT:

  `<int>` the number of students who could have completed high school

## Source

<https://dpi.wi.gov/wisedash/download-files/type?field_wisedash_upload_type_value=hs-completion>
