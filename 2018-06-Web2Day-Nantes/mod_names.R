horizontalPage <- function(title, ...){
  
  tagList(
    includeCSS("style.css"),
    htmlTemplate("head.html", title = title),
    HTML('<body>'),
    h1(title), 
    HTML('<div id="page-wrap">'),
    ..., 
    HTML("<div></body></html>")
  )
  
}

horizontalBox <- function(title, content){
  htmlTemplate("box.html", title = title, content = content)
}

welcome_UI <- function(id){
  ns <- NS(id)
  tagList(
    textOutput(ns("welcome")),
    tags$img(src = "http://memesbams.com/wp-content/uploads/2017/10/21-Much-Wow-Dog-Meme.jpg", width="300")
  )

}

welcome <- function(input, output, session){
  
  output$welcome <- renderText({
    glue::glue('Bienvenue sur ma super page, nous somme le {Sys.Date()}.')
  })
}

plot_modUI <- function(id){
  ns <- NS(id)
  fluidPage(
    column(12, 
           textOutput(ns("titre"))),
    column(12, 
           plotOutput(ns("plop")))
  )
}

plot_mod <- function(input, output, session, dataset, col1, col2){
  col1 <- enquo(col1)
  col2 <- enquo(col2)
  titre <- deparse(substitute(dataset))
  output$titre <- renderText({
    h3(glue::glue("Magnifique graphe de {titre}"))
  })
  output$plop <- renderPlot({
    ggplot(dataset) + 
      aes(!!col1, !!col2) + 
      geom_point()
  })
}

