school_years <- function() {
    tibble::tibble(
        Fall = 1990:2026,
        Spring = Fall + 1,
        SCHOOL_YEAR = sprintf("%d-%s",
                              Fall,
                              "%d" |> sprintf(Spring) |> substr(3, 4))
    )
}

test_that("fall years extract correctly", {
    yrs <- school_years()
    expect_equal(fall_year(yrs$SCHOOL_YEAR),
                 yrs$Fall)
})

test_that("spring years extract correctly", {
    yrs <- school_years()
    expect_equal(spring_year(yrs$SCHOOL_YEAR),
                 yrs$Spring)
})
