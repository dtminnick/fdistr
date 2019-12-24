context("create_ecdf")

data(words)

plot <- create_ecdf(words$letter_count)

test_that("plot has the proper structure", {

      expect_that(plot, is_a("gg"))
      expect_that(plot$labels$title, equals("ECDF Chart"))
      expect_that(plot$labels$subtitle, equals(""))
      expect_that(plot$labels$caption, equals(""))
      expect_that(plot$labels$x, equals("Quartiles"))
      expect_that(plot$labels$y, equals("Frequency"))

})

test_that("function returns an error", {

      expect_that(create_ecdf(), throws_error())

})
