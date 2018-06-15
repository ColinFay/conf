tweets <- readr::read_csv("tweets.csv")
library(ggplot2)
library(dplyr)

#' @apiTitle RStudioConf tweets
#' @apiDescription Tweets collected with {rtweet} during the 2018 RStudio Conference

#' An endpoint to test the API
#'
#' @param q Something to print back
#' @get /test

function(q=""){
  list(msg = paste0("You entered: '", q, "'"),
       class = class(q))
}

#' Plot tweets from one user
#'
#' @param n how much users to look for
#' @get /whoplot
#' @png (width = 1200, height = 600)

function(n){
  p <- tweets %>%
    count(user_key) %>%
    top_n(as.numeric(n)) %>%
    ggplot() +
    aes(reorder(user_key, n), n) +
    geom_col() +
    coord_flip() +
    labs(x = "Noms",
         y = "Compte") +
    theme_minimal()
  print(p)
}
