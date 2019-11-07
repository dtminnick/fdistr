#' Get Unique Observations
#'
#' \code{get_unique_observations} returns a vector containing the set of unique
#' values in a series of observations.
#'
#' @param observations A vector containing a series of observations.
#'
#' @return A vector containing a set of unique observations.  If an error or
#' warning occurs, a message will be printed to the console and the function
#' will return NULL.
#'
#' @examples
#' \dontrun{
#' my_observations <- c(1, 2, 3, 4, 5, 5, 6, 6, 7, 8, 8)
#' unique_observations <- get_unique_observations(my_observations)
#'
#' my_observations <- c("white", "blue", "blue", "red", "red")
#' unique_observations <- get_unique_observations(my_observations)
#' }
#'
#' @export

get_unique_observations <- function(observations) {

      tryCatch({

            observations <- unique(observations)

      }, warning = function(w) {

            print(paste("get_unique_observations: ", w, sep = ""))

            return(NULL)

      }, error = function(e) {

            print(paste("get_unique_observations: ", e, sep = ""))

            return(NULL)

      }, finally = {

      })

      return(observations)

}