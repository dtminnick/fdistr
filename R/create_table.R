#' Create Table
#'
#' \code{create_table} generates a frequency distribution table from a vector,
#' list or data frame input.
#'
#' @details \code{create_table} returns a data frame that includes five variables:
#' group, count, frequency, cumulative count and cumulative frequency.
#'
#' @param source vector, list or data frame input.
#'
#' @param dec_pos Number of positions to return in the frequency and cumulative
#' frequency variables.  Defaults to two positions following the decimal.
#'
#' @return A data frame containing the frequency distribution table.
#' If an error or warning occurs, a message will be printed to the console and
#' the function will return NULL.
#'
#' @importFrom dplyr arrange desc mutate rename select
#'
#' @importFrom magrittr %>%
#'
#' @examples
#' \dontrun{
#' source <- c(1, 1, 2, 2, 3, 3, 4, 4)
#' table <- create_table(source, dec_pos = 4)
#' }
#'
#' @export

create_table <- function(source, dec_pos = 2) {

      tryCatch({

            source <- as.data.frame(cbind(table(source)))

            source <- source %>%
                  dplyr::rename(count = V1) %>%
                  dplyr::arrange(dplyr::desc(count)) %>%
                  dplyr::mutate(group = rownames(source),
                                cumulative_count = cumsum(count),
                                frequency = round(count / sum(count), dec_pos),
                                cumulative_frequency = round(cumulative_count / sum(count), dec_pos)) %>%
                  dplyr::select(group,
                                count,
                                frequency,
                                cumulative_count,
                                cumulative_frequency)

            rownames(source) <- NULL

      }, warning = function(w) {

            print(paste("create_table: ", w, sep = ""))

            return(NULL)

      }, error = function(e) {

            print(paste("create_table: ", e, sep = ""))

            return(NULL)

      }, finally = {

      })

      return(source)

}