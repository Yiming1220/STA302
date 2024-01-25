### Preamble ###
# Purpose: Download dataset about apartment building evaluation in Toronto
# Author: Yiming Tang
# Date: 21 January 2023
# Contact: ym.tang@mail.utoronto.ca


### Workspace setup ###
library(opendatatoronto)
library(tidyverse)

### Download Apartment evaluation data ###
library(readr)

# Download the first dataset (Pre-2023 Apartment Building Evaluations)

# Read data
apartment <- read_csv(
  file = "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/4ef82789-e038-44ef-a478-a8f3590c3eb1/resource/979fb513-5186-41e9-bb23-7b5cc6b89915/download/Pre-2023%20Apartment%20Building%20Evaluations.csv"
  
)



# set pathway
file_apartment <- "./input/data/apartment.csv"

# write data
write_csv(x = apartment, file = file_apartment)

