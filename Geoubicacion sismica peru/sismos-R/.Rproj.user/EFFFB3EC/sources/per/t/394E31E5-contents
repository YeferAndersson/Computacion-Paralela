#nuevas formas

str(datos3)

library(sp)
library(rmarkdown)
library(dplyr)
library(lubridate)
library(ggmap)
library(ggplot2)
library(viridis)



  
#por region
sismo_puno = datos3 %>% filter(LONGITUD > -71.11809 , LONGITUD < -68.81422 , LATITUD > -17.29547 , LATITUD < -13.00393 )
peru_d$geometry[peru_d$NOMBDEP == "PUNO"]

coordenadas_dep = data.frame(dep = c(), minx=c(), miny=c(), maxx = c(), maxy = c())

for (i in 1:25) {
  minx = as.data.frame(st_coordinates(peru_d[i,]$geometry))$X %>% min()
  miny = as.data.frame(st_coordinates(peru_d[i,]$geometry))$Y %>% min()
  maxx = as.data.frame(st_coordinates(peru_d[i,]$geometry))$X %>% max()
  maxy = as.data.frame(st_coordinates(peru_d[i,]$geometry))$X %>% max()
  agregar = data.frame(dep = c(peru_d[i,]$NOMBDEP), minx=c(minx), miny=c(miny), maxx = c(maxx), maxy = c(maxy))
  coordenadas_dep = rbind(coordenadas_dep,agregar)
}



ggplot(data = peru_d %>%
         filter(NOMBDEP=="PUNO")) +
  geom_sf() +
  geom_point(data = sismo_puno,
             aes(x = LONGITUD,
                 y = LATITUD,
                 color = MAGNITUD,
                 alpha = MAGNITUD,
                 size = MAGNITUD))+
  scale_radius(range = c(0.2,3))+
  scale_color_viridis() +
  labs(title="Magnitud de los sismos en la Region de Puno",
       subtitle="Desde el 1960",
       caption="Datos de IGP2022")


#Mapa de calor
ggplot(data = peru_d) +
  geom_sf() + 
  stat_density2d(data = datos3,
                 aes(x = LONGITUD ,
                     y = LATITUD,
                     fill = ..level..,
                     alpha = ..level..),
                 geom = "polygon",
                 size = 0.01,
                 bins = 8) +
  scale_fill_gradient(low = "yellow",
                      high = "red") +
  scale_alpha(range = c(0.2, 0.7)) +
  theme(legend.position = "none") +
  labs(title="Mapa de calor",
       subtitle="Desde el 1960",
       caption="Datos de IGP2022")


#2
ggplot(data = peru_d) +
  geom_sf() +
  geom_density2d(data = datos3,
                 aes(x = LONGITUD,
                     y = LATITUD),
                 size = 0.9,
                 bins = 8) +
  stat_density2d(data = datos3,
                 aes(x = LONGITUD,
                     y = LATITUD,
                     fill = ..level..,
                     alpha = ..level..),
                 geom = "polygon",
                 size = 0.01,
                 bins = 8) +
  theme(legend.position = "none")+
  labs(title="Mapa de calor - 2",
       subtitle="Desde el 1960",
       caption="Datos de IGP2022")
  

library(rcartocolor)
library(plotly)
#magnitud
mapa_magnitud <- ggplot(data = peru_d) +
  geom_sf() +
  geom_point(data = datos3,
             aes(x = LONGITUD,
                 y = LATITUD,
                 color = MAGNITUD,
                 alpha = MAGNITUD,
                 size = MAGNITUD))+
  scale_radius(range = c(0.15,2.5))+
  scale_color_viridis()+
  labs(title="Magnitud de los sismos",
       subtitle="Desde el 1960",
       caption="Datos de IGP2022")

mapa_magnitud

#ggplotly(mapa_magnitud,tooltip = "MAGNITUD")

#PROFUNDIDAD
ggplot(data = peru_d) +
  geom_sf() +
  geom_point(data = datos3,
             aes(x = LONGITUD,
                 y = LATITUD,
                 color = PROFUNDIDAD,
                 alpha = PROFUNDIDAD,
                 size = PROFUNDIDAD))+
  scale_radius(range = c(0.2,3))+
  scale_color_viridis()+
  labs(title="Profundidad de los sismos",
       subtitle="Desde el 1960",
       caption="Datos de IGP2022")

#POR AÑO
ggplot(data = peru_d) +
  geom_sf() +
  geom_point(data = datos3 %>% filter(year(FECHA_UTC) == 2021),
             aes(x = LONGITUD,
                 y = LATITUD,
                 color = MAGNITUD,
                 alpha = MAGNITUD,
                 size = MAGNITUD))+
  scale_radius(range = c(1,3))+
  scale_color_viridis()+
  labs(title="Magnitud de los sismos",
       subtitle="En el año 2021",
       caption="Datos de IGP2022")


