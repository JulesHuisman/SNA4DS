
#' Make a matrix from a vertex attribute
#'
#' Create a matrix based on a vertex attribute
#'
#' This function creates a matrix on the basis of a vertex attribute in an
#' object of class \code{igraph} or \code{network}. In this case, the vertex
#' attribute provided in the \code{name} argument will be extracted.
#'
#' Alternatively, \code{x} can be a numeric vector provided by the user.
#'
#' This vector/attribute is then used to construct a valued matrix, which can be
#' fed into \code{igraph} or \code{network} for further use.
#'
#' The function hosts several options to create this valued matrix with:
#'
#' \itemize{
#' \item absdiff the absolute difference between values for two vertices
#' \item diff the difference is returned, so the value of the vertex with the
#' lower vertex index minus the value of the vertex with the higher vertex
#' index. This value can be negative.
#' \item sum the sum of the values for both vertices
#' \item max the highest value between the two vertices
#' \item min the highest value between the two vertices
#' \item mean the mean between the two vertices
#' }
#'
#' If \code{diag == FALSE} (the default), the diagonal of the returned matrix
#' will contain zeroes. If \code{diag} is any other value, then that will be
#' inserted into the diagonal. Using recycling rules, any object of fitting
#' length is accepted.
#' If \code{diag == TRUE}, the \code{measure} will also be applied to the
#' diagonal elements.
#'
#' @param x input, a numeric vector or an object of class \code{igraph} or
#' \code{network}
#' @param name the name of the attribute to be extracted. This will only be used
#' if \code{x} is of class \code{igraph} or \code{network}
#' @param measure character, currently a choice between "absdiff", "diff",
#' "sum", "max", "min". The default value is \code{"absdiff"}
#' @param diag if \code{FALSE} (the default), the diagonal will be zero. If
#' anything else, the diagonal is filled with that (if it fits)
#'
#' @return matrix
#' @export
#'
#' @examples
#' make_matrix_from_vertex_attribute(1:5)
#' make_matrix_from_vertex_attribute(1:5, measure = "sum", diag = 99)
#' make_matrix_from_vertex_attribute(1:5, measure = "max", diag = NA)
#' make_matrix_from_vertex_attribute(1:5, measure = "sum", diag = TRUE)
#' make_matrix_from_vertex_attribute(1:5, measure = "min", diag = 11:15)
#' \dontrun{
#' data(florentine, package = "SNA4DS")
#' # absdiff, with zeroes on the diagonal
#' make_matrix_from_vertex_attribute(florentine$floattrs$Wealth)
#' }
#'
make_matrix_from_vertex_attribute <- function (x, name,
                                                measure = c("absdiff", "diff",
                                                            "sum", "max", "min",
                                                            "mean"),
                                                diag = FALSE) {
  if (inherits(x, "igraph")) {
    X <- igraph::get.vertex.attribute(graph = x, name = name)
  } else if (inherits(x, "network")) {
      X <- network::get.vertex.attribute(flomar_network, name)
  } else if (is.null(dim(x)) || max(dim(x)) == 1) {
      X <- x
  } else (
    stop ("'x' has to be an igraph object, a network object, or a numeric vector")
  )

  if (!is.numeric(X)) stop("The data should be numeric only.")
  if (any(is.na(X))) stop("The attribute contains missing data, which can not
                          logically be handled by this function.")

  dX <- length(X)
  Y <- X
  FUN <- match.arg(measure)
  Y <- rep(Y, rep.int(length(X), length(Y)))
  X <- rep(X, times = ceiling(length(Y)/length(X)))

  XY <- cbind(X, Y)
  if (FUN == "diff") {
    robj <- X - Y
  } else if (FUN == "absdiff") {
    robj <- abs(X - Y)
  } else if (FUN == "sum") {
    robj <- X + Y
  } else if (FUN == "max") {
    robj <- apply(XY, 1, max)
  } else if (FUN == "min") {
    robj <- apply(XY, 1, min)
  } else if (FUN == "mean") {
    robj <- apply(XY, 1, mean)
  }

  dim(robj) <- c(dX, dX)
  if (is.logical(diag)) { # logical or NA
    if (is.na(diag)) { # if NA, then fill that on the diagonal
      diag(robj) <- diag
    } else if (!diag) { # if FALSE, put zeroes
      diag(robj) <- 0
    } # if TRUE leave as is
  } else {
    diag(robj) <- diag   # if anything else, put that on the diagonal
  }

  robj
}
