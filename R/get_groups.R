#' Get Groups
#'
#' \code{get_groups} calculates a number of groups for a number of observations
#' using the logarithm calculation \code{log(observations) / log(2)}.
#'
#' @details \code{get_groups} expects to receive an integer as an input value.
#' If the function is passed a non-integer value, e.g. 9.5, it will round the
#' value up to the nearest integer.
#'
#' @param observations An integer representing the number of observations to be
#' grouped.
#'
#' @return An integer representing the result of the logarithm calculation.
#' If an error or warning occurs, a message will be printed to the console and
#' the function will return NULL.
#'
#' @examples
#' \dontrun{
#' number_of_groups <- get_groups(1000)
#' }
#'
#' @export

get_groups <- function(observations) {

      tryCatch({

            observations <- ceiling(observations)

            groups <- ceiling(log(observations) / log(2))

      }, warning = function(w) {

            print(paste("get_groups: ", w, sep = ""))

            return(NULL)

      }, error = function(e) {

            print(paste("get_groups: ", e, sep = ""))

            return(NULL)

      }, finally = {

      })

      return(groups)

}