#### Preamble ####
# Purpose: Simulate a dataset resembling the fire incidents dataset from the City of Toronto.
# Author: Sinan Ma
# Email: sinan.ma@utoronto.ca
# Date: 23 January 2024
# License: MIT
# Prerequisites: None

#### Workspace setup ####
install.packages("tidyverse")
library(tidyverse)


#### Simulate ####
set.seed(853)

simulated_incidents_data <-
  tibble(
    date = rep(x = as.Date("2018-01-01") + c(0:364), times = 3),
    area_of_origin = sample(
      c('Engine Area', 'Trash/Rubbish Area', 'Unknown', 'Kitchen', 'Bedroom'), 
      365 * 3, replace = TRUE
    ),
    building_status = sample(
      c('Normal', 'Damaged', 'Destroyed', 'Under Construction'), 
      365 * 3, replace = TRUE
    ),
    estimated_dollar_loss = 
      rpois(
        n = 365 * 3, 
        lambda = 20000
      ),  # Simulate estimated dollar loss using Poisson distribution.
    civilian_casualties = 
      rpois(
        n = 365 * 3, 
        lambda = 1
      )  # Simulate civilian casualties using Poisson distribution.
  )

# Display the head of the simulated data
head(simulated_incidents_data)
