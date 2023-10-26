library(sf)
library(here)
library(raster)
library(terra)
library(fs)
library(tidyverse)
library(ggplot2)
library(farver)
library(dplyr)
library(janitor)
library(tmap)

inequalityData <- read_csv("F:/UCL/Geographic Information Systems and Science (CASA0005)/WK4/homework/HDR21-22_Composite_indices_complete_time_series.csv")
                        locale = locale(encoding = "latin1"))
inequality_Data_change <- inequalityData %>%
  filter_all(all_vars(!(toupper(.) %in% "N"))) %>%
  select_if(~!all(is.na(.)))

inequality_two_time <-inequality_Data_change %>%
  select(country,gii_2010, gii_2019) %>%
  mutate(different = (gii_2010 -  gii_2019))


world_map <- st_read("F:/UCL/Geographic Information Systems and Science (CASA0005)/WK4/homework/World_Countries_Generalized/World_Countries_Generalized.shp")
plot(world_map)                     

inequality_two_time%>% clean_names(.)

difference_map <- world_map %>% 
  clean_names() %>%
  left_join(., 
            inequality_two_time,
            by = c("country" = "country"))

tm_shape(difference_map) + 
  tm_fill("different", style = "quantile", palette = "Blues")
qtm(difference_map, fill = "different", col = "reds")

