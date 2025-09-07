test_that("**is_tested** detects integers in a character vector", {
  expect_equal(is_tested(c("foo", "3", "99", "-1", "12", NA)),
               c(FALSE, TRUE, TRUE, FALSE, TRUE, NA))
})

test_that("**is_proficient** rates 3+ as a pass by default", {
    expect_equal(is_proficient(c("foo", "3", "99", "-1", "12", NA)),
                 c(FALSE, TRUE, TRUE, FALSE, TRUE, FALSE))
})

test_that("**is_proficient** can change its threshold", {
    expect_equal(is_proficient(c("foo", "3", "99", "-1", "12", NA), 4),
                 c(FALSE, FALSE, TRUE, FALSE, TRUE, FALSE))
    expect_equal(is_proficient(c("foo", "3", "99", "-1", "12", NA), 13),
                 c(FALSE, FALSE, TRUE, FALSE, FALSE, FALSE))
    expect_equal(is_proficient(c("foo", "3", "99", "-1", "12", NA), 100),
                 c(FALSE, FALSE, FALSE, FALSE, FALSE, FALSE))
})

test_that("**count_if** filters correctly", {
    expect_equal(count_if(c(1, 1, 2, 3, 5, 8),
                          c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE)),
                 c(1, 0, 2, 0, 5, 0))
    expect_equal(count_if(c(1, 1, 2, 3, 5, 8),
                          c(FALSE, TRUE, FALSE, TRUE, FALSE, TRUE)),
                 c(0, 1, 0, 3, 0, 8))
})

test_that("**load_forward** handles the example sheet", {
    expect_snapshot_value(load_forward(test_path("data/forward_example.csv")),
                          style = "serialize")
})

test_that("**wrangle_forward** summarizes to school as expected", {
    EXAMPLE_FORWARD <- readRDS(test_path("data/pretend forward data.rds"))
    wrangled <- wrangle_forward(EXAMPLE_FORWARD,
                                "DISTRICT_CODE",
                                "SCHOOL_CODE",
                                "GROUP_BY",
                                "GROUP_BY_VALUE")
    expect_equal(wrangled,
                 tibble::tibble(
                     DISTRICT_CODE = rep(c("0000", "0248", "1123"), c(3, 6, 3)),
                     SCHOOL_CODE = rep(c(NA, "0120", "9100", NA), each = 3),
                     GROUP_BY = rep("Disability Status", 12),
                     GROUP_BY_VALUE = rep(c("SwD", "SwoD", "Unknown"), 4),
                     Students = c(42, 29, 21, 37, 39, 28, 21, 39, 28, 34, 35, 26),
                     Score = c(614.2895298, 1175.699427, 1154.949265, 382.6420502, 1554.754784, 1305.167718, 1390.459944, 350.2674766, 330.0761377, 2070.312619, 1313.815998, 1130.531237),
                     Tested = c(35, 22, 18, 34, 31, 26, 14, 37, 17, 28, 26, 17),
                     Proficient = c(14, 16, 10, 12, 13, 16, 9, 16, 3, 14, 17, 3),
                     `Testing Rate` = c(0.833333333333333, 0.758620689655172, 0.857142857142857, 0.918918918918919, 0.794871794871795, 0.928571428571429, 0.666666666666667, 0.948717948717949, 0.607142857142857, 0.823529411764706, 0.742857142857143, 0.653846153846154),
                     `Success Rate` = c(0.4, 0.727272727272727, 0.555555555555556, 0.352941176470588, 0.419354838709677, 0.615384615384615, 0.642857142857143, 0.432432432432432, 0.176470588235294, 0.5, 0.653846153846154, 0.176470588235294)
                 ))
})

test_that("**wrangle_forward** implicitly summarizes across schoolls", {
    EXAMPLE_FORWARD <- readRDS(test_path("data/pretend forward data.rds"))
    wrangled <- wrangle_forward(EXAMPLE_FORWARD,
                                "GROUP_BY",
                                "GROUP_BY_VALUE")
    expect_equal(wrangled,
                 tibble::tibble(
                     GROUP_BY = rep("Disability Status", 3),
                     GROUP_BY_VALUE = c("SwD", "SwoD", "Unknown"),
                     Students = c(134L, 142L, 103L),
                     Score = c(4457.704143, 4394.5376856, 3920.7243577),
                     Tested = c(111L, 116L, 78L),
                     Proficient = c(49L, 62L, 32L),
                     `Testing Rate` = c(111/134, 116/142, 78/103),
                     `Success Rate` = c(49/111, 62/116, 32/78)
                 ))
})
