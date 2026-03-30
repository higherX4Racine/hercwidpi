# Helper predicate for detecting when students took the Forward exam.

Helper predicate for detecting when students took the Forward exam.

## Usage

``` r
is_tested(.result_codes)
```

## Arguments

- .result_codes:

  *\<chr\>* usually the TEST_RESULT_CODE column from a WISEDash data
  set.

## Value

*\<lgl\>* `TRUE` when the `.result_codes` value contains a digit
