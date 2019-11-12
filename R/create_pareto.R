
#' Create Pareto Chart
#'
#' \code{create_pareto} generates a Pareto chart...
#'
#' @param df Data frame containing a frequency distribution table.
#'
#' @param title Character string; title to be displayed on Pareto chart.  Default
#' is "Pareto Chart".
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
#' @return A plot containing a Pareto chart.  If an error or warning occurs,
#' a message will be printed to the console and the function will return NULL.
#'
#' @importFrom ggplot2 aes annotate geom_bar geom_line geom_point geom_segment
#' ggplot guides labs scale_x_discrete scale_y_continuous
#'
#' @examples
#' \dontrun{
#'
#' }
#'
#' @export

create_pareto <- function(df,
                          title = "Pareto Chart",
                          subtitle = "",
                          caption = "",
                          x_label = "Groups",
                          y_label = "Frequency") {

      tryCatch({

         g <- ggplot2::ggplot(df, ggplot2::aes(x = reorder(group, -count))) +

               ggplot2::geom_bar(ggplot2::aes(y = count),
                                 fill = "blue",
                                 stat = "identity") +

               ggplot2::geom_point(ggplot2::aes(y = cumulative_count),
                                   color = "green",
                                   pch = 16,
                                   size = 1) +

               ggplot2::geom_path(ggplot2::aes(y = cumulative_count, group = 1),
                                  colour = "darkgrey",
                                  lty = 3,
                                  size = 0.9) +

               ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.6)) +

               ggplot2::labs(title = title,
                             subtitle = subtitle,
                             caption = caption,
                             x = x_label,
                             y = y_label)

      }, warning = function(w) {

            print(paste("create_pareto: ", w, sep = ""))

            return(NULL)

      }, error = function(e) {

            print(paste("create_pareto: ", e, sep = ""))

            return(NULL)

      }, finally = {

      })

      return(g)

}