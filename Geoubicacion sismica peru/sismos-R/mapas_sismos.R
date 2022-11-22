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

abctest = c()
abctest = c(abctest,2)

DEPARTAMENTO = c()
for (j in 1:25) {
  for (k in 1:(nrow(datos3))) {
    if(datos3[k,]$LONGITUD > coordenadas_dep[j,]$minx & 
       datos3[k,]$LATITUD > coordenadas_dep[j,]$miny &
       datos3[k,]$LONGITUD < coordenadas_dep[j,]$maxx &
       datos3[k,]$LATITUD < coordenadas_dep[j,]$maxy ){
      DEPARTAMENTO = c(DEPARTAMENTO,coordenadas_dep[j,]$dep)
    }
  }
}

if(2 < 3 & 
   4 < 3 & 
   2 < 3 ){
  print("true")
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
  scale_color_viridis()

mapview(peru_d$geometry)

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
  theme(legend.position = "none")


ggplot(data = peru_d) +
  geom_sf() + theme(legend.position = 'none') +
  geom_polygon(data = bohol_mapdf,
               aes(x =long,
                   y = lat,
                   group = group),
               color = "darkcyan") +
  stat_density2d(aes(fill = ..level..,
                     x = longitude,
                     y = latitude),
                 alpha = .4,
                 bins = 8,
                 geom = "polygon",
                 data = Oct_2015_Quake) +
  scale_fill_viridis() +
  geom_polygon(data = loon_mapdf,
               aes(x = long,
                   y = lat,
                   group = group),
               color = "green",
               fill = "red")
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
  theme(legend.position = "none")

ggplot(data = peru_d) +
  geom_sf() + 
  

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
  scale_radius(range = c(0.2,3))+
  scale_color_viridis()

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
  scale_color_viridis()


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
  scale_color_viridis()


