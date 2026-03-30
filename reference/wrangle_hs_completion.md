# Convert raw data read from WISEDash Public files into a StriveTogether-friendly format

Convert raw data read from WISEDash Public files into a
StriveTogether-friendly format

## Usage

``` r
wrangle_hs_completion(.DATA, ...)
```

## Arguments

- .DATA:

  a data frame in the format returned by
  [`read_wisedash_public()`](https://higherx4racine.github.io/hercwidpi/reference/read_wisedash_public.md)

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  *\<chr\>* grouping fields for computing graduate counts and completion
  rates.

## Value

a tibble with at `length(...) + 3` columns:

- ...:

  the grouping variables specified by `...`

- Students:

  *\<int\>* the number of students who could have graduated by the end
  of the school year

- Graduates:

  *\<int\>* the number of students who received a high school credential
  by the end of the school year

- Completion Rate:

  *\<int\>* the number of students who received a high school credential
  by the end of the school year

## See also

[`read_wisedash_public()`](https://higherx4racine.github.io/hercwidpi/reference/read_wisedash_public.md)
