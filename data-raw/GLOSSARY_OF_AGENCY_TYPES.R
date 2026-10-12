## Copyright (C) 2026 by Higher Expectations for Racine County

GLOSSARY_OF_AGENCY_TYPES <- tibble::tribble(
    ~ AGENCY_TYPE_ID, ~ AGENCY_TYPE,
                  1L, "Non District Charter Schools",
                  2L, "Public School",
                  3L, "Public Schools-Multidistrict Charters"
)

usethis::use_data(GLOSSARY_OF_AGENCY_TYPES, overwrite = TRUE)
