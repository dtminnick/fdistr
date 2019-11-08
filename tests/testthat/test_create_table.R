context("create_table")


test_that("function returns a numeric value", {

      expect_that(get_groups(10), is_a("numeric"))
      expect_that(get_groups(100), is_a("numeric"))
      expect_that(get_groups(1000), is_a("numeric"))
      expect_that(get_groups(10000), is_a("numeric"))
      expect_that(get_groups(100000), is_a("numeric"))

})

test_that("function returns correct value", {

      expect_that(get_groups(10), equals(4))
      expect_that(get_groups(100), equals(7))
      expect_that(get_groups(1000), equals(10))
      expect_that(get_groups(10000), equals(14))
      expect_that(get_groups(100000), equals(17))
      expect_that(get_groups(9.5), equals(4))

})

test_that("function returns an error", {

      expect_that(get_groups(), throws_error())
      expect_that(get_groups("10"), throws_error())
      expect_that(get_groups("ten"), throws_error())
      expect_that(get_groups(10, 100, 1000), throws_error())

})
