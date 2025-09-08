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
                     `Testing Rate` = c(35/42, 22/29, 18/21, 34/37, 31/39, 26/28, 14/21, 37/39, 17/28, 28/34, 26/35, 17/26),
                     `Success Rate` = c(14/35, 16/22, 10/18, 12/34, 13/31, 16/26,  9/14, 16/37,  3/17, 14/28, 17/26,  3/17)
                 ))
})

test_that("**wrangle_forward** implicitly summarizes across schools and districts", {
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

test_that("**wrangle_forward** mixes implicit and explicit grouping", {
    EXAMPLE_FORWARD <- readRDS(test_path("data/pretend forward data.rds"))
    wrangled <- wrangle_forward(EXAMPLE_FORWARD,
                                "DISTRICT_NAME",
                                "GROUP_BY",
                                "GROUP_BY_VALUE")
    expect_equal(wrangled,
                 tibble::tibble(
                     DISTRICT_NAME = rep(c("[Statewide]", "Shawano Example School District", "Waupaca Demonstration Schools"), each = 3),
                     GROUP_BY = rep("Disability Status", 9),
                     GROUP_BY_VALUE = rep(c("SwD", "SwoD", "Unknown"), 3),
                     Students = c(42L, 29L, 21L, 58L, 78L, 56L, 34L, 35L, 26L),
                     Score = c(614.2895298, 1175.6994270, 1154.9492650, 1773.1019942, 1905.0222606, 1635.2438557, 2070.3126190, 1313.8159980, 1130.5312370),
                     Tested = c(35L, 22L, 18L, 48L, 68L, 43L, 28L, 26L, 17L),
                     Proficient = c(14L, 16L, 10L, 21L, 29L, 19L, 14L, 17L, 3L),
                     `Testing Rate` = c(35/42, 22/29, 18/21, 48/58, 68/78, 43/56, 28/34, 26/35, 17/26),
                     `Success Rate` = c(14/35, 16/22, 10/18, 21/48, 29/68, 19/43, 14/28, 17/26,  3/17)
                 ))
})
