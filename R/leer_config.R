

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
  
  tryCatch(expr = {
    #Leer el xml y convertirlo a lista
    
  
  library("methods")
  result <- xmlParse(file = configPath)
  config <- xmlToList(result, addAttributes = TRUE, simplify = FALSE)
    
  }, error = function(e){
    
    logerror("Config no encontrado en su ruta. Verifica que se llama config.xml",
             logger = 'log')
    stop()
  })
  
  loginfo("Config leido", logger = 'log')
  
  config$columnas$predictorasNumericas <- trimws(strsplit(config$columnas$predictorasNumericas, ",")[[1]])
  loginfo("Llegas aqui=?", logger = 'log')
  
}
