library(leaflet)
library(leaflet.esri)
library(htmlwidgets)
library(sf)
library(rgdal)


# load vector data --------------------------------------------------------

sac <- st_read("data/SACs.shp")

# create webmap -----------------------------------------------------------

m <- leaflet() %>% 
  addTiles(group = "Basemap") %>% 
  setView(-1.2576985, 51.751975, 11) %>% 
  addEsriFeatureLayer(url = "https://services.arcgis.com/JJzESW51TqeY9uat/arcgis/rest/services/SSSI_England/FeatureServer/0",
                      popupProperty = "SSSI_NAME",
                      group = "SSSI") %>% 
  addPolygons(data = sac, group = "SAC", color = "red") %>% 
  addLayersControl(baseGroups = "Basemap", overlayGroups = c("SSSI", "SAC"))

m

saveWidget(m, file = "index.html")
