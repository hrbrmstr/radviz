#' Add color to the charts
#'
#' @param rv radviz object
#' @param color_accessor name of column/dimension to use for coloring
#' @param palette a vector of D3 colors that you wish to use (ordinal range that should
#'        match the number of categoris in \code{color_accessor} (optional)
#' @export
add_color <- function(rv, color_accessor, palette=NULL) {

  if (!is.null(palette)) {
    rv$x$usePalette <- TRUE
    rv$x$palette <- palette;
  }

  rv$x$colorAccessor <- color_accessor

  rv

}