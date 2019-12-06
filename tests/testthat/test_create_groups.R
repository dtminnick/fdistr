context("create_groups")

data(words)

table <- create_table(words$letter_count)

test_that("function returns an error", {

      expect_that(create_groups(), throws_error())

})