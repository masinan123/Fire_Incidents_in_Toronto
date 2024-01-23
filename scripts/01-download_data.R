#### Preamble ####
# Purpose: Downloads and saves the fire incident 
# data from OpenDataToronto
# Author: Sinan Ma
# Email: sinan.ma@utoronto.ca
# Date: 23 January 2024
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
install.packages("opendatatoronto")
install.packages("tidyverse")

library(opendatatoronto)
library(tidyverse)

fire_incidents <- 
  list_package_resources("64a26694-01dc-4ec3-aa87-ad8509604f50") |>
  filter(name == 
           "Fire Incidents Data.csv") |>
  get_resource()

# Filter the dataset and take out the 'year' in 'Ext_agent_app_or_defer_time'
fire_incidents_filtered <- fire_incidents |>
  mutate(year = year(ymd_hms(Ext_agent_app_or_defer_time))) |>
  select(Area_of_Origin, Building_Status, Estimated_Dollar_Loss, year)

#### Save data ####
write_csv(
  x = fire_incidents_filtered,
  file = "inputs/data/filtered_fire_incidents_data.csv"
) # Saving the filtered data to a CSV file

head(fire_incidents_filtered)
