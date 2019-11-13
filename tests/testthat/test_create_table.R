context("create_table")

data(words)

table <- create_table(words$letter_count)

test_that("frequency table has the proper structure", {

      expect_that(table, is_a("data.frame"))
      expect_that(colnames(table), equals(c("group",
                                            "count",
                                            "frequency",
                                            "cumulative_count",
                                            "cumulative_frequency")))
      expect_that(ncol(table), equals(5))
      expect_that(nrow(table), equals(9))
      expect_that(sum(table$count), equals(table$cumulative_count[nrow(table)]))
      expect_that(sum(table$frequency), equals(1))
      expect_that(table$cumulative_frequency[nrow(table)], equals(1))
      expect_that(table$group, is_a("character"))
      expect_that(table$count, is_a("integer"))
      expect_that(table$frequency, is_a("numeric"))
      expect_that(table$cumulative_count, is_a("integer"))
      expect_that(table$cumulative_frequency, is_a("numeric"))

})

test_that("function returns an error", {

      expect_that(create_table(), throws_error())

})
