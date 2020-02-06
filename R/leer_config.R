

#' Title
#'
#' @param path 
#'
#' @return
#' 
#' @import XML
#' @import logging
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
  browser()
  validateConfigNodes(config)
  
  config$columnas$predictorasNumericas <- trimws(strsplit(config$columnas$predictorasNumericas, ",")[[1]])
  
  return(config)
  
  }
  
#' @Title validateConfigNodes
#'
#' @param config 
#'
#' @import logging
#'
validateConfigNodes <- function(config){
    
    nodoPrincipal <- identical(names(config), c("input", "columnas"))
    
   nodoInput <- identical(names(config$input), c("name", "sep"))
   
   nodoColumnas <- identical(names(config$columnas), c("predictorasNumericas","fuenteOriginal",
                                                       "dominio_mail", "fechas", "target", "llamada"))
   
   
   nodoFechas <- identical(names(config$columnas$fechas), c("creacion", "ultima_mod", "envio_ultimo",
                                                            "apertura_primero", "envio_primero",
                                                            "visita_primero", "visita_ultimo",
                                                            "tiempos", "visita_primero", "visita_ultimo" ))
   
   
   nodos <- c("nodoPrincipal" = nodoPrincipal, "nodoInput" = nodoInput,
              "nodoColumnas" = nodoColumnas, "nodoFechas" = nodoFechas)
   
   check <- all(nodos)
   
   if(!check){
     
     nodosMalos <- names(nodos)[!nodos]
     
     logerror(paste0("Los nodos, ",paste(nodosMalos, collapse = ",") , " estan mal estructurados!"),
              logger = 'log')
     
     stop()
   }
  }
