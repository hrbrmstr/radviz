#' Make a radviz
#'
#' @param data \code{data.frame} to use
#' @param draw_links whether to draw links or not
#' @param zoom_factor gets the dimension nodes on a bigger radius than the panel, to pull nodes away from the center
#' @param dot_radius radius of each dot
#' @param use_repulsion special repulsion effect to spread the nodes from each others so they can be better selected
#' @param diameter size of the circle (should be <= \code{width} if that is set to pixels)
#' @param margin margin around the circular panel
#' @param width,height height & width of the widget
#' @export
#' @examples
#' # motor vehicles
#'
#' mtcars_1 <- dplyr::add_rownames(mtcars, var="car")
#'
#' radviz(mtcars_1, diameter=600, margin=100,
#'        use_repulsion=TRUE, draw_links=TRUE,
#'        width=600, height=500) %>%
#'   add_dimensions(c("mpg", "cyl", "disp", "hp", "drat", "wt",
#'                    "qsec", "vs", "am", "gear", "carb")) %>%
#'   add_color("cyl") %>%
#'   add_tooltip("function(d) { return d.car; }")
#'
#' # motor vehicles deaths
#'
#' cardeaths <- data.frame(as.matrix(Seatbelts),
#'                         year=substring(zoo::as.yearmon(time(Seatbelts)), 5, 7))
#'
#' radviz(cardeaths, diameter=600, margin=100,
#'        use_repulsion=FALSE, draw_links=FALSE,
#'        width=600, height=500) %>%
#'   add_dimensions(c("DriversKilled", "PetrolPrice", "VanKilled")) %>%
#'   add_color("year") %>%
#'   add_tooltip("function(d){ return d.year; }")
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
