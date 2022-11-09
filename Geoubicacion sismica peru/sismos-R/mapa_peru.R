install.packages(c("sf","purrr","ggrepel","readxl"))


library(sf)
library(purrr)
library(tidyverse)
library(ggplot2)
library(ggrepel)


dirmapas <- "E:/universidad/8-sem/comp-paralela/Geoubicacion sismica peru/sismos-R/DEPARTAMENTOS_inei_geogpsperu_suyopomalia"

setwd(dirmapas)

peru_d <- st_read("DEPARTAMENTOS_inei_geogpsperu_suyopomalia.shp")

peru_d

#Primer mapa: solo muestra los límites departamentales
ggplot(data = peru_d) +
  geom_sf()

#Graficar solo un departamento: graficaremos Puno
ggplot(data = peru_d %>%
         filter(NOMBDEP=="PUNO")) +
  geom_sf()

peru_d

#nacimientos
ggplot(peru_d) +
  geom_sf(aes(fill = TOTAL_NACI))+
  labs(title = "Total nacimientos",
       caption = "Fuente: GEO GPS Perú
       Elaboración propia",
       x="Longitud",
       y="Latitud")+
  scale_fill_continuous(guide_legend(title = "Total de nacimientos"))
