# Internal helper for extracting a single district's data from WISEDash files

Internal helper for extracting a single district's data from WISEDash
files

## Usage

``` r
batch_excerpt_by_district(.input_path, .pattern, .district_code, .output_path)
```

## Arguments

- .input_path:

  the location of the source files

- .pattern:

  a glob to find the files

- .district_code:

  a pattern to identify a district's data

- .output_path:

  the location to write the resulting files
