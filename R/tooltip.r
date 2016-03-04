#' Add a tooltip to a radviz widget
#'
#' @param rv radviz object
#' @param formatter if \code{NULL} no tooltip will be added. Should be an atomic
#'        character vector with javsascript code. It will be wrapped in a call to
#'        \code{htmlwidgets::JS} (see examples)
#' @export
add_tooltip <- function(rv, formatter=NULL) {

  if (!is.null(formatter)) {
    rv$x$tooltipFormatter <- htmlwidgets::JS(formatter)
    rv$x$useTooltip <- TRUE
  }

  rv

}