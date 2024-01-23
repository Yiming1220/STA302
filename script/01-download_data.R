### Preamble ###
# Purpose: Download dataset about apartment building evaluation in Toronto
# Author: Yiming Tang
# Date: 21 January 2023
# Contact: ym.tang@mail.utoronto.ca


### Workspace setup ###
library(opendatatoronto)
library(tidyverse)

### Download Apartment evaluation data ###
install.packages("readr")
library(readr)

# Download the first dataset (Pre-2023 Apartment Building Evaluations)
  
  file_path_pre_2023 <- "./input/data/pre_2023.csv"    
  pre_2023_data <- read_csv(
      file = "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/4ef82789-e038-44ef-a478-a8f3590c3eb1/resource/979fb513-5186-41e9-bb23-7b5cc6b89915/download/Pre-2023%20Apartment%20Building%20Evaluations.csv",
      show_col_types = FALSE,
      skip = 1
    )
  
  write_csv(x = pre_2023_data, file = file_path_pre_2023)

# Download the second dataset (Current-2023 Apartment Building Evaluations )
  
  file_path_current_2023 <- "./input/data/current_2023.csv"
  
  current_2023_data <- read_csv(
    file = "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/4ef82789-e038-44ef-a478-a8f3590c3eb1/resource/7fa98ab2-7412-43cd-9270-cb44dd75b573/download/Apartment%20Building%20Evaluations%202023%20-%20current.csv",
    show_col_types = FALSE,
    skip = 1
  )

  write_csv(x = current_2023_data, file = file_path_current_2023)
  

