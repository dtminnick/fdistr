context("create_pareto")

data(words)

table <- create_table(words$letter_count)

plot <- create_pareto(table)

test_that("plot has the proper structure", {

      expect_that(plot, is_a("gg"))
      expect_that(plot$labels$title, equals("Pareto Chart"))
      expect_that(plot$labels$subtitle, equals(""))
      expect_that(plot$labels$caption, equals(""))
      expect_that(plot$labels$x, equals("Groups"))
      expect_that(plot$labels$y, equals("Frequency"))

})

test_that("plot uses correct data", {

   expect_that(table, equals(plot$data))

})

test_that("function returns an error", {

      expect_that(create_pareto(), throws_error())

})
