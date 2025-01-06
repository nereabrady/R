install.packages("dplyr")
install.packages("lubridate")
install.packages("tidyr")
library(dplyr)
library(lubridate)
library(tidyr)

# Cargar los datos
df_venta <- read.csv("C:/Users/casa/Documents/R/data_PremiumPizza.csv") %>% tibble()

# Inspeccionar la estructura de los datos
str(df_venta)

# Convertir la columna de fecha a formato Date (si no está ya convertida)
df_venta <- df_venta %>% 
  mutate(FECHA_SEMANA = as.Date(FECHA_SEMANA, format = "%Y-%m-%d"))

# Imputar los valores faltantes en UNIDADES con la media de la columna
df_venta <- df_venta %>% 
  mutate(UNIDADES = ifelse(is.na(UNIDADES), mean(UNIDADES, na.rm = TRUE), UNIDADES))

# Filtrar las observaciones del año 2018
df_2018 <- df_venta %>% 
  filter(year(FECHA_SEMANA) == 2018)

# Calcular las UNIDADES totales vendidas en 2018
total_unidades_2018 <- df_2018 %>% 
  summarise(Total_UNIDADES = sum(UNIDADES)) %>% 
  pull(Total_UNIDADES)

# Resultado
print(total_unidades_2018)

library(dplyr)
library(lubridate)

# Cargar los datos
df_venta <- read.csv("C:/Users/casa/Documents/R/data_PremiumPizza.csv") %>% tibble()

# Convertir la columna FECHA_SEMANA a formato Date
df_venta <- df_venta %>% 
  mutate(FECHA_SEMANA = as.Date(FECHA_SEMANA, format = "%Y-%m-%d"))

# Filtrar las observaciones del año 2019
df_2019 <- df_venta %>% 
  filter(year(FECHA_SEMANA) == 2019)

# Calcular los GRPs medios para el año 2019
grps_medios_2019 <- df_2019 %>% 
  summarise(GRPs_Medios = mean(GRPs, na.rm = TRUE)) %>% 
  pull(GRPs_Medios)

# Imprimir el resultado
print(grps_medios_2019)

