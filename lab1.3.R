energia <- rep(c("Renovable","No Renovable"), times=1,each=10)
consumo <- c(
  248, 243, 153, 111, 145, 154, 179, 89, 178, 112, 134, 221, 241, 158, 
  100, 102, 160, 249, 119, 169, 70, 101, 153, 127, 204, 83, 152, 136, 
  98, 85, 216, 125, 77, 236, 233, 175, 217, 111, 201, 237
)
consumo[c(1,13,36,24)] <- NA
costo_kwh <- c(1,2)
print(consumo)

consumo[is.na(consumo)] = median(consumo, na.rm=TRUE)
 df_consumo <- data.frame(
   Energía = energia,
   Consumo_diario = consumo,
   Coste_kWh = costo_kwh
 )
 print(df_consumo)

 df_consumo$coste_total <- df_consumo$Consumo_diario *df_consumo$Coste_kWh
 print (df_consumo)

suma_consumo_energia <- aggregate(Consumo_diario ~ Energía, data = df_consumo, sum)
print(suma_consumo_energia)
suma_coste_energia <- aggregate(coste_total ~ Energía, data = df_consumo, sum)
print(suma_coste_energia)

media_consumo <- mean(df_consumo$Consumo_diario)

df_consumo$ganancia <- df_consumo$coste_total *1.1
print (df_consumo)

datos_ordenados <- df_consumo[order(-df_consumo$coste_total),]
print(datos_ordenados)

resumen_energia <- list(
  DataFrame_Ordenado = datos_ordenados,                   # El data frame ordenado
  Suma_Consumo_Energia = suma_consumo_energia,
  Suma_Coste_Energia =suma_coste_energia
)

top_3_costos <- head(datos_ordenados, 3)

print (resumen_energia)
