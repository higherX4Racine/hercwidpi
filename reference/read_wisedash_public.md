# Import data from WISEDash Public into a tidy format

Import data from WISEDash Public into a tidy format

## Usage

``` r
read_wisedash_public(.files, .spec)
```

## Arguments

- .files:

  paths to csv files that contain data from WISEDash public

- .spec:

  a list of column specifications for
  [`readr::read_csv()`](https://readr.tidyverse.org/reference/read_delim.html)

## Value

a data frame with some format determined by `.spec`
