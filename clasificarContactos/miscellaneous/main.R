lapply(c("dummies", "logging", "xgboost", "XML"), require, character.only = TRUE)

path <- "C:/Users/clara/Documents/clasificarContactos/clasificarContactos/"

setwd(path)

#List files nos devuelve los archivos dentro del directorio.

lapply(paste0("R/", list.files(path = "R/", recursive = TRUE)), source)

debug(clasificarContactosApp)
#si no quiero ir linea por linea añadir browser()

clasificarContactosApp(path)

undebug(clasificarContactosApp)
