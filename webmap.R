library(leaflet)
library(leaflet.esri)
library(htmlwidgets)

m <- leaflet() %>% 
  addTiles(group = "Basemap") %>% 
  setView(-1.2576985, 51.751975, 12) %>% 
  addEsriFeatureLayer(url = "https://services.arcgis.com/JJzESW51TqeY9uat/arcgis/rest/services/SSSI_England/FeatureServer/0",
                      popupProperty = "SSSI_NAME",
                      group = "Natural England") %>% 
  addLayersControl(baseGroups = "Basemap", overlayGroups = "Natural England")

m

saveWidget(m, file = "index.html")
