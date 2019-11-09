
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

            nr <- nrow(df)

            num <- sum(df$frequency)

            ticks <- data.frame(xtickp = rep(nr + .55, 11),
                                xticks = rep(nr + .59, 11),
                                ytick = seq(0, num, num / 10))

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

            color_palette <- colorRampPalette(colors = c("steelblue", "darkblue"))(nr)

            g <- ggplot2::ggplot(df, ggplot2::aes(x = group, y = frequency)) +

                 ggplot2::geom_bar(stat = "identity", ggplot2::aes(fill = group)) +

                 ggplot2::geom_line(ggplot2::aes(x = group,
                                                 y = cumulative_frequency,
                                                 color = group)) +

                 ggplot2::geom_point(ggplot2::aes(x = group,
                                                  y = cumulative_frequency,
                                                  color = group), pch = 19) +

                 ggplot2::scale_y_continuous(breaks = seq(0, num, num / 10),
                                             limits = c(-.02 * num, num * 1.02)) +

                 ggplot2::scale_x_discrete(breaks = df$group) +

                 # ggplot2::scale_fill_manual(values = color_palette) +

                 ggplot2::guides(fill = FALSE, color = FALSE) +

                 ggplot2::annotate("rect",
                                   xmin = nr + .55,
                                   xmax = nr + 1,
                                   ymin = -.02 * num,
                                   ymax = num * 1.02,
                                   fill = "white") +

                 ggplot2::annotate("text",
                                   x = nr + .8,
                                   y = seq(0, num, num / 10),
                                   label = y2,
                                   size = 3.5) +

                 ggplot2::geom_segment(x = nr + .55,
                                       xend = nr + .55,
                                       y = -.02 * num,
                                       yend = num * 1.02,
                                       color = "black") +

                 ggplot2::geom_segment(data = ticks,
                                       ggplot2::aes(x = xtickp,
                                                    y = ytick,
                                                    xend = xticks,
                                                    yend = ytick)) +

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