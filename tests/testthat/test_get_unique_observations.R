context("get_unique_observations")

test_that("function returns an error", {

      expect_that(get_unique_observations(), throws_error())
      expect_that(get_unique_observations(1, 2, 3), throws_error())
      expect_that(get_unique_observations("one", "two", "three"), throws_error())

})
