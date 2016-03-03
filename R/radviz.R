#' Make a radviz
#'
#' @import htmlwidgets
#' @param data \code{data.frame} to use
#' @param draw_links whether to draw links or not
#' @param zoom_factor gets the dimension nodes on a bigger radius than the panel, to pull nodes away from the center
#' @param dot_radius radius of each dot
#' @param use_repulsion special repulsion effect to spread the nodes from each others so they can be better selected
#' @param diameter size of the circle (should be <= \code{width} if that is set to pixels)
#' @param margin margin around the circular panel
#' @param width,height height & width of the widget
#' @export
radviz <- function(data,
                   draw_links=TRUE,
                   zoom_factor=1,
                   dot_radius=4,
                   use_repulsion=FALSE,
                   diameter=400,
                   margin=50,
                   width=NULL,
                   height=NULL) {

  x <- list(
    data=data,
    drawLinks=draw_links,
    zoomFactor=zoom_factor,
    dotRadius=dot_radius,
    useRepulsion=use_repulsion,
    diameter=diameter,
    margin=margin,
    colorAccessor=NULL,
    useTooltip=FALSE,
    usePalette=FALSE
  )

  htmlwidgets::createWidget(
    name = 'radviz',
    x,
    width = width,
    height = height,
    package = 'radviz'
  )

}

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

#' Add the columns (dimensions) you wish to map in the radviz
#'
#' @param rv radviz object
#' @param dimesions character vector of column names
#' @export
add_dimensions <- function(rv, dimensions) {
  rv$x$dimensions <- dimensions
  rv
}

#' Add a tooltip to a radviz widget
#'
#' @param rv radviz object
#' @param formatter if \code{NULL} no tooltip will be added. Should be an atomic
#'        character vector with javsascript code. It will be wrapped in a call to
#'        \code{htmlwidgets::JS} (see examples)
#' @export
add_tooltip <- function(rv, formatter=NULL) {

  if (is.null(formatter)) {
    rv$x$useTooltip <- FALSE
    rv$x$tooltipFormatter <- htmltools::JS(formatter)
  }

  rv

}