library(sf)
library(purrr)
library(tidyverse)
library(ggplot2)
library(ggrepel)
library(readxl)
library(data.table)
library(viridis)

# Carga del mapa:

dirmapa <- ""
setwd(dirmapa)
ecuador_d <- st_read("nxprovincias.shp")

# Dibujo del mapa: 

ggplot(data = ecuador_d) + geom_sf()

# Dibujo del mapa con el nombre de las provincias:

ecuador_e <- ecuador_d %>% mutate(centroid = map(geometry, st_centroid), 
                                  coords = map(centroid, st_coordinates), 
                                  coords_x = map_dbl(coords, 1), 
                                  coords_y = map_dbl(coords, 2))

ggplot(data = ecuador_e) + 
  geom_sf(fill = "skyblue", color = "black") +
  geom_text_repel(mapping = aes(coords_x, coords_y, label = DPA_DESPRO), size = 2.25)

# Tratamiento de datos que serán mostrados en el mapa: 

mercado_mayorista <- fread("", sep = ";", encoding = "Latin-1")

provincias_mercado <- aggregate(precio_kilo ~ provincia + nombre_producto, mercado_mayorista, mean)

provincias_mercado <- filter(provincias_mercado,nombre_producto %in% c("Aguacate Fuerte"))

provincias_mercado <- provincias_mercado[-c(12),]
provincias_mercado$DPA_DESPRO = toupper(provincias_mercado$provincia)


ecuador_datos <- ecuador_e %>%
  left_join(provincias_mercado, na_matches = c("na", "never"))

# Dibujo del mapa final:

gg_ec = ggplot(ecuador_datos %>%
               filter(DPA_DESPRO %in% provincias_mercado$DPA_DESPRO)) +
  geom_sf(aes(fill= provincias_mercado$precio_kilo)) +
  scale_fill_viridis("precio_kilo") +
  labs(title = "Precio promedio kilo aguacate - Mercados mayoristas Ecuador (2020)",
       caption = "Fuente: Datos abiertos (2020)
       Elaboraci�n propia",
       x="Longitud",
       y="Latitud")+
  # scale_fill_continuous(guide_legend(title = "Precio kilo")) +
  geom_text_repel(mapping = aes(coords_x, coords_y, label = DPA_DESPRO), size = 2.25) +
  theme_bw()
gg_ec

