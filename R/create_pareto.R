
#' Create Pareto Chart
#'
#' \code{create_pareto} generates a Pareto chart...
#'
#' @param df Data frame containing a frequency distribution table.
#'
#' @return A plot containing a Pareto chart.  If an error or warning occurs,
#' a message will be printed to the console and the function will return NULL.
#'
#' @importFrom dplyr arrange desc mutate rename select
#'
#' @importFrom ggplot2
#'
#' @importFrom magrittr %>%
#'
#' @examples
#' \dontrun{
#'
#' }
#'
#' @export

create_pareto <- function(df) {

      tryCatch({

            ticks <- data.frame(xtick0 = rep(nrow(df) + .55, 11),
                                xtick1 = rep(nrow(df) + .59, 11),
                                ytick = seq(0, sum(df$frequency), sum(df$frequency)/10))

            y2 <- c("  0%",
                    " 10%",
                    " 20%",
                    " 30%",
                    " 40%",
                    " 50%",
                    " 60%",
                    " 70%",
                    " 80%",
                    " 90%",
                    "100%")

            g <- ggplot2:ggplot(df, aes(x = modality, y = frequency)) +
                  geom_bar(stat = "identity", aes(fill = modality_int))

      }, warning = function(w) {

            print(paste("create_pareto: ", w, sep = ""))

            return(NULL)

      }, error = function(e) {

            print(paste("create_pareto: ", e, sep = ""))

            return(NULL)

      }, finally = {

      })

      return(source)

}