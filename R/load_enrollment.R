## Copyright (C) 2026 by Higher Expectations for Racine County

#' Syntactic sugar for loading reports about student demographics.
#'
#' @inheritParams read_wisedash_public
#'
#' @returns a data frame with 14 columns, as described by [SPEC_FOR_ENROLLMENT]
#' @export
#' @seealso [read_wisedash_public()]
#' @seealso [SPEC_FOR_ENROLLMENT]
load_enrollment <- function(.files) {
    read_wisedash_public(.files, hercwidpi::SPEC_FOR_ENROLLMENT)
}
