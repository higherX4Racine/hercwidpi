# Summarize post-secondary enrollment information

Summarize post-secondary enrollment information

## Usage

``` r
wrangle_ps_enrollment(.DATA, ...)
```

## Arguments

- .DATA:

  a data frame with columns from
  [`SPEC_FOR_PS_ENROLLMENT`](https://higherx4racine.github.io/hercwidpi/reference/SPEC_FOR_PS_ENROLLMENT.md)

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  *\<chr\>* grouping fields for computing post-secondary enrollment
  counts and rates

## Value

a data frame with `length(...) + 6 columns`

- ...:

  each grouping field

- Students:

  *\<int\>* the total number of students in the group

- Enrollers:

  *\<dbl\>* the mean scale score of the group's students

- Enrollment Rate:

  *\<dbl\>* the proportion of students who were tested and achieved
  proficiency
