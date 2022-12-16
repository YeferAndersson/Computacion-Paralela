#uso de fechas en nuestros datos

library(lubridate)
library(tidyverse)

#importar datos CSV
dir_datos <- file.choose()
datos <- read.csv(dir_datos,header = T, sep = ",")

str(datos)
head(datos)
datos <- datos[-8]

#transformacion a datos de fecha
datos = datos %>% transform(FECHA_UTC = as.Date(as.character(FECHA_UTC), format = "%Y%m%d"))

year(datos$FECHA_UTC)
max(year(datos$FECHA_UTC))
min(year(datos$FECHA_UTC))



freq <- table(year(datos$FECHA_UTC))
freq <- as.data.frame(freq)

x <- freq$Var1
y <- freq$Freq
str(freq)
ggplot(freq, mapping = aes(Var1,Freq)) + geom_col()
ggplot(freq, mapping = aes(as.numeric(Var1),Freq)) + geom_point() + geom_line()

ggplot(datos, aes(x = year(FECHA_UTC))) + geom_bar()
ggplot(datos, aes(x = year(FECHA_UTC))) + geom_smooth()


