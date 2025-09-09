test_that("assigns NA to correct wisedash values", {
    dumb <- "data" |>
        test_path(
            "read_wisedash_public_example.csv"
        ) |>
        read_wisedash_public(
            list(Foo = "i",
                 Bar = "n",
                 Baz = "c",
                 Barf = "c")
        )
    expect_equal(dim(dumb), c(4, 4))
    expect_equal(dumb$Foo,
                 c(1L, 5L, NA, 7L))
    expect_equal(dumb$Bar,
                 c(1.0, 8.0, 4.0, NA))
    expect_equal(dumb$Baz,
                 c(NA, "Utah", "Polysyllabic", "Terse"))
    expect_equal(dumb$Barf,
                 c("Three", NA, "Nope", "42"))

})


test_that("different specs give different results", {
    dumb <- "data" |>
        test_path(
            "read_wisedash_public_example.csv"
        ) |>
        read_wisedash_public(
            list(Foo = "i",
                 Bar = "d",
                 Baz = "c",
                 Barf = "-")
        )
    expect_equal(dim(dumb), c(4, 3))
    expect_equal(dumb$Foo,
                 c(1L, 5L, NA, 7L))
    expect_equal(dumb$Bar,
                 c(1.0, 8.0, 4.0, NA))
    expect_equal(dumb$Baz,
                 c(NA, "Utah", "Polysyllabic", "Terse"))
})
