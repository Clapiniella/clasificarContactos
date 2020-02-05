

#' Title
#'
#' @param path 
#'
#' @return
#' 
#' @import XML
#'
#' @examples
leerConfig <- function(path){
  
  library(XML)
  configPath <- paste0(path, "config/config.xml")
  
  #Leer el xml y convertirlo a lista
  
  library("methods")
  result <- xmlParse(file = configPath)
  
  lista <- xmlToList(result, addAttributes = TRUE, simplify = FALSE)
  lista
  
  }