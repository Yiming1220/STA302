### Preamble ###
# Purpose: Cleaning dataset about apartment building evaluation in Toronto
# Author: Yiming Tang
# Date: 21 January 2023
# Contact: ym.tang@mail.utoronto.ca

### Load library ###
library(tidyverse)
library(ggplot2)
library(corrplot)
library(readr)
  
### Read data ###
apartment <- read_csv(
  file = "./input/data/apartment.csv"
  
)
  
### Check data / data description ###

  # check dimension
  dim(apartment)
  
  # summary data
  summary(apartment)
  
  # check the na values
  sum(is.na(apartment))
  
### Data clean ###
  # copy the data
  apartment_clean<- apartment
  
  # delete col
  apartment_clean<- apartment_clean[,-c(1:4, 8,9,12,14,36:40 )]
  
  summary(apartment_clean)
  
  apartment_clean1<- apartment_clean
  
  # change variables to numeric
  apartment_clean1[, 3:27] <- lapply(apartment_clean1[, 3:27], function(x) as.numeric(unlist(x)))
  
  # check the na values again
  sum(is.na(apartment_clean1))
  
  # delete the na values
  apartment_clean1<- na.omit(apartment_clean1)
  
  # Check the proportion of remaining data
  dim(apartment_clean1)/dim(apartment_clean)
  
  11760  * 0.85
  11760 - 9996
  
  apartment_clean2<- apartment_clean
  
  # change variables to numeric again
  apartment_clean2[, 3:27] <- lapply(apartment_clean2[, 3:27], function(x) as.numeric(unlist(x)))
  
  # Check the number of na values in each column
  summary(apartment_clean2)
  
  dim1<- dim(apartment_clean)
  apartment_clean<- apartment_clean2[,-c(14, 16, 17, 24, 27)]
  
  # delete the na values
  apartment_clean<- na.omit(apartment_clean)
  dim2<- dim(apartment_clean)
  
  dim2/ dim1
  
  # check outliers
  Fig_outlier <- ggplot(apartment_clean, aes(y = SCORE)) +
    geom_boxplot(fill = "blue", color = "black", alpha = 0.7) +
    labs(title = "Figure 1: Boxplot of Scores", x = "", y = "Score") +
    theme(plot.title = element_text(hjust = 0.5))
  
  ggsave("Fig_outlier.png", plot = Fig_outlier, path = "./output/figure", width = 10, height = 8, dpi = 300)
  
  # define outliers
  Q1 <- quantile(apartment_clean$SCORE, 0.25)
  Q3 <- quantile(apartment_clean$SCORE, 0.75)
  IQR <- Q3 - Q1
  lower_fence <- Q1 - 1.5 * IQR
  upper_fence <- Q3 + 1.5 * IQR
  
  # remove outliers
  apartment_clean[, 6][apartment_clean[, 6] < lower_fence | apartment_clean[, 6] > upper_fence] <- NA
  
  sum(is.na(apartment_clean))
  apartment_clean<- na.omit(apartment_clean)

  # set pathway
  apartment_clean_path <- "./input/data/apartment_clean.csv"
  
  write_csv(x = apartment_clean, file = apartment_clean_path)
  