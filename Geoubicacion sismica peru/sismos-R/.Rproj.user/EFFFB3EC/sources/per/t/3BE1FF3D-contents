#uso de fechas en nuestros datos

library(lubridate)
library(tidyverse)

datos3 <- read.csv(dir_datos,header = T, sep = ",")

str(datos3)

head(datos3)

datos3 = datos3 %>% transform(FECHA_UTC = as.Date(as.character(FECHA_UTC), format = "%Y%m%d"),
                     FECHA_CORTE = as.Date(as.character(FECHA_CORTE), format = "%Y%d%m"))

year(datos3$FECHA_UTC)
max(year(datos3$FECHA_UTC))
min(year(datos3$FECHA_UTC))

freq <- table(year(datos3$FECHA_UTC))
freq <- as.data.frame(freq)

x <- freq$Var1
y <- freq$Freq
str(freq)
ggplot(freq, mapping = aes(Var1,Freq)) + geom_col()
ggplot(freq, mapping = aes(as.numeric(Var1),Freq)) + geom_point() + geom_line()

ggplot(datos3, aes(x = year(FECHA_UTC))) + geom_bar()
ggplot(datos3, aes(x = year(FECHA_UTC))) + geom_smooth()


