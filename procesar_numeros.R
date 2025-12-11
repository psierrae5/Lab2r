
leer_numeros <- function(archivo) {
  if (!file.exists(archivo)) {
    stop(paste("Error: El archivo", archivo, "no existe."))
  } else {
  lineas <- readLines(archivo)
  vector <- as.integer(lineas)
  return(vector)
  }
}
main <- function() {
  archivo_entrada <- "numeros.txt"
  vector <- leer_numeros(archivo_entrada)
  media <- mean(vector)
  mediana <- median(vector)
  desviacion <- sd(vector)
  if (desviacion>10){
    print("Hay alta variabilidad en los datos")
  }
  vector_cuadrados <- sapply(vector,function(x) x^2)
  
  salida <- file("resultados.txt", open = "w")
  writeLines("Los resultados son:",salida)
  writeLines(paste("De media tenemos ", media),salida)
  writeLines(paste("De mediana tenemos ", mediana),salida)
  writeLines(paste("De desviación estándar tenemos ", desviacion),salida)
  writeLines("Los cuadrados son: ",salida)
  writeLines(paste(vector_cuadrados, collapse = ", "),salida)
  close(salida)
}

main()

