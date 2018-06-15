library(shiny)
library(ggplot2)
library(dplyr)

rm(ui);rm(server)
ui <- horizontalPage( title = "An horizontal Shiny App",
                      horizontalBox(title = "Salut", content = welcome_UI("wl")),
                      horizontalBox(title = "Un graphe", content = plot_modUI("box1")),
                      horizontalBox(title = "Un deuz graphe", content = plot_modUI("box2")),
                      horizontalBox(title = "Un troiz graphe", content = plot_modUI("box3")),
                      horizontalBox(title = "Numéro 4", content = plot_modUI("box4"))
)

server <- function(input, output, session) {
  
  callModule(welcome, "wl")
  callModule(plot_mod, "box1", iris, Sepal.Length, Sepal.Width)
  callModule(plot_mod, "box2", airquality, Wind, Temp)
  callModule(plot_mod, "box3", mtcars, mpg, cyl)
  callModule(plot_mod, "box4", faithful, eruptions, waiting)
  
}

shinyApp(ui, server)

