## Copyright (C) 2026 by Higher Expectations for Racine County

recode_grade_levels <- function(.text_grade_levels) {

    .text_grade_levels |>
        stringr::str_replace("KG", "0") |>
        stringr::str_replace("K\\d|PK", "-1") |>
        as.integer() |>
        factor(
            labels = stringr::str_pad(c("PK", "KG", 1:12), 2, "left", "0")
        )
}
