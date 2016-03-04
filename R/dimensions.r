#' Add the columns (dimensions) you wish to map in the radviz
#'
#' @param rv radviz object
#' @param dimesions character vector of column names
#' @export
add_dimensions <- function(rv, dimensions) {
  rv$x$dimensions <- dimensions
  rv
}