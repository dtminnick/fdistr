
#' Create Empirical Cumulative Distribution Function (ECDF)
#'
#' \code{create_ecdf} generates a plot of the Empirical Cumulative Distribution
#' Function (ECDF) using the observed data.  The ECDF shows the proportion of
#' obervations that are less than or equal to each obvsered value.
#'
#' @param vector Vector containing the observed numeric data.
#'
#' @param title Character string; title to be displayed on Pareto chart.  Default
#' is "ECDF Plot".
#'
#' @param subtitle Character string; subtitle to be displayed on chart.  Default
#' is "".
#'
#' @param caption Character string; caption to be displayed on the chart.  Default
#' is "".
#'
#' @param x_label Character string; x axis label to be displayed on the chart.
#' Default is "Groups".
#'
#' @param y_label Character string; y axis label to be displayed on the chart.
#' Default is "Frequency".
#'
#' @return A plot containing the ECDF.  If an error or warning occurs,
#' a message will be printed to the console and the function will return NULL.
#'
#' @importFrom ggplot2 aes geom_step geom_vline ggplot labs scale_x_continuous
#'
#' @importFrom stats quantile
#'
#' @examples
#' source <- c(1, 1, 1, 1, 2, 2, 2, 3, 3, 4)
#' plot <- create_ecdf(source)
#'
#' @export

create_ecdf <- function(vector,
                        title = "ECDF Chart",
                        subtitle = "",
                        caption = "",
                        x_label = "Quartiles",
                        y_label = "Frequency") {

      tryCatch({

            quartiles <- NULL

            quartiles <- stats::quantile(vector)

            g <- ggplot2::ggplot(NULL, ggplot2::aes(x = vector)) +

                  ggplot2::geom_step(stat = "ecdf") +

                  ggplot2::geom_vline(ggplot2::aes(xintercept = quartiles),
                                      linetype = "dashed") +

                  ggplot2::scale_x_continuous(breaks = quartiles,
                                     labels = quartiles) +

                  ggplot2::labs(title = title,
                                subtitle = subtitle,
                                caption = caption,
                                x = x_label,
                                y = y_label)

      }, warning = function(w) {

            warning(paste("create_ecdf: ", w, sep = ""))

            return(NULL)

      }, error = function(e) {

            stop(paste("create_ecdf: ", e, sep = ""))

            return(NULL)

      }, finally = {

      })

      return(g)

}
