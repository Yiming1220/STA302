### Preamble ###
# Purpose: Download dataset about apartment building evaluation in Toronto
# Author: Yiming Tang
# Date: 21 January 2023
# Contact: ym.tang@mail.utoronto.ca

library(tidyverse)
install.packages("janitor")
library(janitor)

raw_pre_2023_data <- read_csv(
  file_path_pre_2023, 
  show_col_types = FALSE)


raw_current_2023_data <- read_csv(
  file_path_current_2023, 
  show_col_types = FALSE)

pre_2023_data <- raw_pre_2023_data %>% janitor::clean_names()
current_data <- raw_current_2023_data %>% janitor::clean_names()

pre_2023_data <- raw_pre_2023_data %>% drop_na()
current_data <- raw_current_2023_data %>% drop_na()

current_data <- raw_current_2023_data %>% mutate(your_column = as.numeric(your_column))
pre_2023_data <- raw_pre_2023_data %>% mutate(your_column = as.numeric(your_column))


cleaned_pre_2023_data <- 
  pre_2023_data |>
  janitor::clean_names() |>


