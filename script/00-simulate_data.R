### Preamble ###
# Purpose: Simulates dataset about apartment building evaluation in Toronto
# Author: Yiming Tang
# Date: 21 January 2023
# Contact: ym.tang@mail.utoronto.ca

### Data Expectations ###
# Each evaluation has a unique id
# Each building has a unique id
# Year evaluation start from 2017 to 2023
# One unique building can be evaluated more than one time across from 2017-2023
# Each criterion scores from 0-3

### Workspace setup ###
library(tidyverse)
library(ggplot2)

### Simulate data ###

set.seed(123) 

simulated_data <- tibble(
  evaluation_id = 1:200,
  building_id = sample(1:100, size = 200, replace = TRUE), 
  year_evaluated = sample(2017:2023, size = 200, replace = TRUE),
  criterion1 = sample(0:3, size = 200, replace = TRUE),
  criterion2 = sample(0:3, size = 200, replace = TRUE)
)

### Data Visualization ###
library(ggplot2)

# Distribution of building id
fig_1 <-
  ggplot(simulated_data, aes(x = building_id)) +
  geom_bar(fill = "blue", color = "black") +
  theme_minimal() +
  labs(title = "Distribution of Building IDs", x = "Building ID", y = "Frequency")

ggsave("output1.png", plot = fig_1, path = "./output/figure", width = 10, height = 8, dpi = 300)

# Distribution of year evaluation 
fig_2 <- ggplot(simulated_data, aes(x = year_evaluated)) +
  geom_bar(fill = "blue", color = "black") +
  theme_minimal() +
  labs(title = "Distribution of Year Evaluated", x = "Year Evaluated", y = "Frequency")

ggsave("output2.png", plot = fig_2, path = "./output/figure", width = 10, height = 8, dpi = 300)

# Distribution of criterion 1 score
fig_3 <- ggplot(simulated_data, aes(x = criterion1)) +
  geom_bar(fill = "green", color = "black") +
  theme_minimal() +
  labs(title = "Distribution of Criterion 1 Scores", x = "Criterion 1 Score", y = "Frequency")

ggsave("output3.png", plot = fig_3, path = "./output/figure", width = 10, height = 8, dpi = 300)

# Distribution of criterion 2 score
fig_4 <- ggplot(simulated_data, aes(x = criterion2)) +
  geom_bar(fill = "red", color = "black") +
  theme_minimal() +
  labs(title = "Distribution of Criterion 2 Scores", x = "Criterion 2 Score", y = "Frequency")

ggsave("output4.png", plot = fig_4, path = "./output/figure", width = 10, height = 8, dpi = 300)

### Test ###
library(testthat)

# Test if each evaluation has a unique ID
test_that("Each evaluation has a unique ID", {
  expect_equal(length(unique(simulated_data$evaluation_id)), 200)
})
# Test if the year of evaluation is between 2017 and 2023
test_that("Year evaluation is between 2017 and 2023", {
  expect_true(all(simulated_data$year_evaluated >= 2017 & simulated_data$year_evaluated <= 2023))
})

# Test if each criterion score is from 0 to 3
test_that("Each criterion score is from 0-3", {
  expect_true(all(simulated_data$criterion1 %in% 0:3))
  expect_true(all(simulated_data$criterion2 %in% 0:3))
})






