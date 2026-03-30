# Helper predicate for detecting when students passed the Forward exam.

Helper predicate for detecting when students passed the Forward exam.

## Usage

``` r
is_proficient(.result_codes, .proficiency_threshold = 3L)
```

## Arguments

- .result_codes:

  *\<chr\>* usually the TEST_RESULT_CODE column from a WISEDash data
  set.

- .proficiency_threshold:

  *\<int\>* the lowest result code that counts as success

## Value

*\<lgl\>* `TRUE` when the numeric value of `.result_codes` meets or
exceeds the `.proficiency_threshold`
