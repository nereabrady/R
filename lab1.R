#creacion de vectores
categorias <- rep(c("Ficción","No Ficción"),times=1,each=10)
ventas <- c(
  12, 20, 15, 18, 13, 21, 30, 22, 9, 16,
  10, 12, 15, 18, 20, 27, 11, 13, 24, 25
)
fechas <- c(
  "2024-12-01", "2024-12-02", "2024-12-03", "2024-12-04", "2024-12-05",
  "2024-12-06", "2024-12-07", "2024-12-08", "2024-12-09", "2024-12-10",
  "2024-12-11", "2024-12-12", "2024-12-13", "2024-12-14", "2024-12-15",
  "2024-12-16", "2024-12-17", "2024-12-18", "2024-12-19", "2024-12-20"
)
fechas_date <- as.Date(fechas)

datos_ventas <- data.frame(
  Fecha = fechas,
  Categoria = categorias,
  Ventas = ventas
)

suma_ventas_categoria <- aggregate(Ventas ~ Categoria, data = datos_ventas, sum)
print(suma)

media_ventas <- mean(datos_ventas$Ventas)
mediana_ventas <- median(datos_ventas$Ventas)
print(media_ventas)
print (mediana_ventas)

datos_ordenados <- datos_ventas[order(-datos_ventas$Ventas),]
print(datos_ordenados)

nombre <- c("Nerea Brady Barranco")

resumen_final <- list(
  DataFrame_Ordenado = datos_ordenados,                   # El data frame ordenado
  Suma_Ventas_Por_Categoria = suma_ventas_categoria, # La suma total de ventas por categoría
  Mi_Nombre = nombre
)
  print (resumen_final)
