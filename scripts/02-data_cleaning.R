#### Preamble ####
# Purpose: Cleans the fire incident data from filtered data
# Author: Sinan Ma
# Email: sinan.ma@utoronto.ca
# Date: 23 January 2024
# License: MIT
# Pre-requisites: None

install.packages("janitor")
install.packages("tidyverse")

library(janitor)
library(tidyverse)

#### Clean data ####
fire_incidents_clean <- 
  fire_incidents_filtered |>
  clean_names() |>
  drop_na()

head(fire_incidents_clean)

#### Save data ####
write_csv(
  x = fire_incidents_clean,
  file = "outputs/data/cleaned_fire_incidents_data.csv"
) # Saving the cleaned data to a CSV file
