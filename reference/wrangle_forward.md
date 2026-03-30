# Summarize forward results

Summarize forward results

## Usage

``` r
wrangle_forward(.DATA, ..., .proficiency_threshold = 3L)
```

## Arguments

- .DATA:

  a data frame with columns from
  [`SPEC_FOR_FORWARD`](https://higherx4racine.github.io/hercwidpi/reference/SPEC_FOR_FORWARD.md)

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  *\<chr\>* grouping fields for computing testing and success rates.

- .proficiency_threshold:

  *\<int?\>* the lowest score code that counts as proficient (defaults
  is `3`)

## Value

a data frame with `length(...) + 6 columns`

- ...:

  each grouping field

- Students:

  *\<int\>* the total number of students in the group

- Score:

  *\<dbl\>* the mean scale score of the group's students

- Tested:

  *\<int\>* the number of students in the group who took the test

- Proficient:

  *\<int\>* the number of students who were tested and achieved
  proficiency

- Testing Rate:

  *\<dbl\>* the proportion of students in the group who took the test

- Proficiency Rate:

  *\<dbl\>* the proportion of students who were tested and achieved
  proficiency
