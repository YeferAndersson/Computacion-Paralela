dir_datos <- file.choose()
datos <- read.csv(dir_datos,header = T, sep = ",")

library(sf)
install.packages("tmap")
library(tmap)
library(sp)
library(ggplot2)

head(datos)

coordinates(datos) <- ~LONGITUD + LATITUD

datos <- st_as_sf(datos)

st_crs(datos) <- 4326


ggplot(data = datos) + geom_sf(alpha = 0.1)


install.packages("mapview")

library(mapview)

mapview(peru_d) +
mapview(datos, zcol = "MAGNITUD",legend = FALSE, cex = "pop")

#Con mapas leaflet
datos2 <- read.csv(dir_datos,header = T, sep = ",")
library(leaflet)
library(leaflet.extras) 
library(rworldxtra)
library(tidyverse)
library(sf)
library(raster)

leaflet() %>% 
  addTiles() %>% 
  addCircles(data = datos2, lat = ~LATITUD, lng = ~LONGITUD)

leaflet() %>% 
  addTiles() %>% 
  addHeatmap(data = datos2, lat = ~LATITUD, lng = ~LONGITUD, blur = 2.5, radius = 2.3)



heat_map <- leaflet() %>% addTiles()
for (i in 1:length(datos2$MAGNITUD)) {
  heat_map = heat_map %>% 
    addHeatmap(data = datos2$MAGNITUD, lat = ~datos2$LATITUD, lng = ~datos2$LONGITUD, blur = 25, radius = 20)
}
heat_map %>% 
  addLayersControl(baseGroups = nombres, 
                   options = layersControlOptions(collapsed = FALSE))