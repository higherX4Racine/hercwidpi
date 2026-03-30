# Helper for conditionally including values in a total

Helper for conditionally including values in a total

## Usage

``` r
count_if(.counts, .mask)
```

## Arguments

- .counts:

  *\<int\>* counts, a la `STUDENT_COUNT`, that may be incorporated in a
  total

- .mask:

  *\<lgl\>* whether or not a value of `.counts` should be included

## Value

`.counts` when `.mask` is true, or zero otherwise
