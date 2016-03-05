# silly test to check multiple radviz on a page
#   and make sure tooltips work as expected

library(shiny)
library(radviz)

ui <- fluidPage(
 fluidRow(
   column(
     width = 6,
     radvizOutput("radviz1")
   ),
   column(
     width = 6,
     radvizOutput("radviz2")
   )
 ) 
)

server <- function(input,output,session){
  output$radviz1 <- renderRadviz({
    radviz(iris, diameter=400, margin=100, 
           use_repulsion=TRUE, draw_links=TRUE, 
           width=400, height=500
    ) %>% 
      add_dimensions(c('Sepal.Length', 'Sepal.Width', 
                       'Petal.Length', 'Petal.Width')) %>% 
      add_color("Species") %>% 
      add_tooltip("function(d){ return 'Petal width: ' + d['Petal.Length']; }")
  })
  
  output$radviz2 <- renderRadviz({
    radviz(iris, diameter=400, margin=100, 
           use_repulsion=TRUE, draw_links=TRUE, 
           width=400, height=500
    ) %>% 
      add_dimensions(c('Sepal.Length', 'Sepal.Width', 
                       'Petal.Length', 'Petal.Width')) %>% 
      add_color("Species") %>% 
      add_tooltip("function(d){ return 'Petal width: ' + d['Petal.Length']; }")
  })
}

shinyApp(ui,server)
