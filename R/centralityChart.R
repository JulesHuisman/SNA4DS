
#' centralityChart
#'
#' Make a chart with centrality scores
#'
#' This function creates a facet path plot that displays the chosen centrality measures.
#' Currently, three centrality measures are implemented: "betweenness", "closeness"
#' , and degree". One or more of these can be chosen.
#'
#' The \code{mode} is any of "all", "out", "in", "total". Character string,
#' defines the types of the paths used for measuring the distance in directed
#' graphs. “in” measures the paths to a vertex, “out” measures paths from a
#' vertex, all uses undirected paths. This argument is ignored for undirected
#' graphs.
#'
#' The names of the vertices are plotted on the y-axis IF a \code{name} attribute
#' is present for the vertices. Otherwise, their IDs are used.
#'
#' The default is a point plot. Depending on the neatness of the network object,
#' it is possible to turn this into a nicer path plot. For this option, set
#' \code{path} to \code{TRUE}. Depending on the data, this can become a really nice
#' plot, or become really messy. This is why the default if \code{FALSE}. But feel
#' free to try it out on a dataset.
#'
#' The function takes an \code{igraph}-object as input.
#'
#' @param net a network of class \code{igraph}
#' @param measures one or more centrality measures
#' @param directed logical, should direction be taken into account? This argument
#' is optional, if it is not chosen the directionality of the network will be used.
#' @param mode Character, used for closeness and degree. The default is "all".
#' @param normalized Logical scalar, whether to normalize the centrality scores.
#' The default is \code{TRUE}, which makes the centralities more motually comparable.
#' @param path logical, is \code{TRUE} a path plot is created.
#'
#' @return a plot
#' @export
#'
#' @examples
#' \dontrun{
#' g <- igraph::erdos.renyi.game(20, 1/20)
#' centralityChart(g, measures = c("degree", "betweenness"))
#' # note that closeness is not well-defined for disconnected graphs
#' centralityChart(g)
#' }
centralityChart <- function(net,
                            measures = c("betweenness", "closeness", "degree"),
                            directed = igraph::is.directed(net),
                            mode = c("all", "out", "in", "total"),
                            normalized = TRUE,
                            path = FALSE) {
  if (any(!measures %in% c("betweenness", "closeness", "degree"))) {
    stop('Only "betweenness", "closeness", "degree" are currently implemented.')
  }

  mode <- match.arg(mode)
  out <- matrix(ncol = 3)
  colnames(out) <- c("node", "measure", "value")
  out <- as.data.frame(out[-1, ])

  if (is.null(igraph::V(net)$name)) {
    namen <- igraph::as_ids(igraph::V(net))
  } else {
    namen <- igraph::V(net)$name
  }

  mode <- match.arg(mode)
  out <- matrix(ncol = 3)
  colnames(out) <- c("node", "measure", "value")
  out <- as.data.frame(out[-1, ])

  if ("betweenness" %in% measures) {
    score <- igraph::betweenness(net, directed = directed, normalized = normalized)
    out <- rbind(out, data.frame(node = namen, measure = "Betweenness", value = score))
  }
  if ("closeness" %in% measures) {
    score <- igraph::closeness(net, normalized = normalized)
    out <- rbind(out, data.frame(node = namen, measure = "Closeness", value = score))
  }
  if ("degree" %in% measures) {
    score <- igraph::degree(net, mode = mode, normalized = normalized)
    out <- rbind(out, data.frame(node = namen, measure = "Degree", value = score))
  }
  g <- ggplot2::ggplot(out, ggplot2::aes(x = .data[["value"]], y = .data[["node"]], group = 1))
  if (path) {
    g <- g + ggplot2::geom_path()
  }
  g <-  g + ggplot2::xlab("") + ggplot2::ylab("") +
    ggplot2::geom_point() + ggplot2::facet_grid(~measure, scales = "free") +
    ggplot2::theme_bw()
  g
}
