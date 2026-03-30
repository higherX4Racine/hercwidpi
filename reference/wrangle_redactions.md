# Handle situations where missing data at the school level has propagated to missing data at the district level

Handle situations where missing data at the school level has propagated
to missing data at the district level

## Usage

``` r
wrangle_redactions(.DATA, .groups, .sum_fields)
```

## Arguments

- .DATA:

  *\<tbl\>* data from WISEDash that includes both `SCHOOL_CODE` and
  `DISTRICT_CODE` fields.

- .groups:

  *\<chr\>* a vector of column names that identify grouping variables

- .sum_fields:

  *\<chr\>* a vector of column names that identify values to aggregate

## Value

a data frame with the columns from `.groups` and `.sum_fields`
