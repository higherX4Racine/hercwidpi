## Copyright (C) 2026 by Higher Expectations for Racine County

#' Functions for parsing the SCHOOL_YEAR column in WISEDash data
#'
#' @param SCHOOL_YEAR `<chr>` a string in YYYY-YY format that describes the span of years for a school year
#' @name school_year
NULL

#' @rdname school_year
#' @export
fall_year <- function(SCHOOL_YEAR) {
    SCHOOL_YEAR |>
        substr(1, 4) |>
        as.integer()
}

#' @rdname school_year
#' @export
spring_year <- function(SCHOOL_YEAR) {
    1L + fall_year(SCHOOL_YEAR)
}
