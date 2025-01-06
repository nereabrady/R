
#Importamos la libreria lubridate para usarla posteriormente
#En R solemos importar los paquetes al inicio del script
library(lubridate)

####-----
#ENTENDAMOS CON UN EJEMPLO SENCILLO COMO FUNCIONA IF ELSE DE FORMA CONCEPTUAL

variable_condicional <- 10

if(14>variable_condicional){
  print("14 es mayor que variable condicional")
} else {
  print("14 es menor o igual que variable condicional")
}

#####----
#AHORA PASEMOS A UN EJEMPLO MAS PRACTICO

#Vamos a leer el archivo de venta diaria
#Es conveniente que hayais ejecutado el script de ficheros para crear un
#archivo csv para cada tienda
df <- read.csv(file.choose())
df

if(nrow(df)<1000000){
  print("Correcto - El archivo tiene menos de 1.000.000 de filas")
  
  #Comprobamos que solo hay ventas de una tienda en el archivo
  if(length(unique(df$TIENDA))==1){
    print("Correcto - Contiene las ventas de una sola tienda")
    
    #Vamos a comprobar si la tienda ha cumplido los objetivos de 2018 y 2019 
    #(vender mas de 215.000 unidades)
    
    #Primero nos tenemos que quedar con el año 2018 y 2019.
    #Lo podemos hacer de varias formas (siempre hay distintas soluciones hay un problema)
    
    #1 Lo hacemos para 2018 con las fechas completas
    df_2018 <- df[(df$DIA>="2018-01-01") & (df$DIA<="2018-12-31"),]
    total_2018 <- sum(df_2018$UNIDADES, na.rm = T)
    
    #2 Lo hacemos para 2019 usando la funcion year de lubridate
    df_2019 <- df[year(df$DIA)==2019,]
    total_2019 <- sum(df_2019$UNIDADES, na.rm = T)
    
    #Hay cuatro posibilidades en base a los resultados
    if((total_2018>215000) & (total_2019>215000)){
      print(paste0("La tienda ",df_2018$TIENDA[1]," ha cumplido con el objetivo en 2018 y 2019"))
    } else if((total_2018>215000) & (total_2019<=215000)) {
      print(paste0("La tienda ",df_2018$TIENDA[1]," ha cumplido con el objetivo en 2018 pero NO en 2019"))
    } else if((total_2018<=215000) & (total_2019>215000)) {
      print(paste0("La tienda ",df_2018$TIENDA[1]," ha cumplido con el objetivo en 2019 pero NO en 2018"))
    } else{
      print(paste0("La tienda ",df_2018$TIENDA[1]," NO ha cumplido con el objetivo ni en 2018 ni en 2019"))
    }
    
    #Printeamos la venta total de cada año
    print(paste0("Ha vendido ",round(total_2018)," unidades en 2018"))
    print(paste0("Ha vendido ",round(total_2019)," unidades en 2019"))
    
  } else {
    print("Error - No contiene el numero de tiendas adecuado")
  }
  
} else {
  print("Error - El archivo contiene mas de un 1.000.000 de filas")
}
