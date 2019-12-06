
#' Create Groups
#'
#' \code{create_groups} groups discrete values into buckets that can be used to
#' generate a frequency distribution table.  This function is useful when the
#' data has so many values it would not make sense to generate the table with
#' the values themselves.
#'
#' @details \code{create_groups} replaces each discrete value with the
#' appropriate group based on the parameters passed to the function.
#'
#' @param source Vector, list or data frame input.  If the source is of class
#' list, it will be simplified to a vector using \code{unlist}.
#'
#' @param low Integer, the lowest value used to generate the groups.
#'
#' @param high Integer, the highest value used to generate the groups.
#'
#' @param step Integer, the interval used to break up the range of
#' discrete values.
#'
#' @return A data frame containing the group values.  If an error or warning
#' occurs, a message will be printed to the console and the function will
#' return NULL.
#'
#' @examples
#' \dontrun{
#' table <- c(10, 20, 25, 30, 35, 35,
#'            35, 40, 50, 75, 85, 95)
#' table <- create_groups(table, 10, 100, 10)
#' }
#'
#' @export

create_groups <- function(source, low, high, step) {

      tryCatch({

            if(class(source) == "list") {

               source <- unlist(source)

            }

            breaks <- seq(from = low,
                          to = high,
                          by = step)

            labels <- c(paste(seq(from = low,
                                  to = high,
                                  by = step),
                              seq(from = low + step - 1,
                                  to = high + step,
                                  by = step),
                              sep = "-"),
                        paste(high, "+",
                        sep = ""))

            source <- cut(floor(source),
                          breaks = breaks,
                          Inf,
                          labels = labels,
                          right = FALSE)

      }, warning = function(w) {

            warning(paste("create_groups: ", w, sep = ""))

            return(NULL)

      }, error = function(e) {

            stop(paste("create_groups: ", e, sep = ""))

            return(NULL)

      }, finally = {

      })

      return(source)

}
