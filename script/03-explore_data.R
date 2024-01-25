### Preamble ###
# Purpose: Test dataset about apartment building evaluation in Toronto
# Author: Yiming Tang
# Date: 21 January 2023
# Contact: ym.tang@mail.utoronto.ca

# load library
library(ggplot2)

# read the cleaned data
apartment_clean<- read.csv(apartment_clean_path)

# Histogram for score
Fig_his <- ggplot(apartment_clean, aes(x = SCORE)) +
  geom_histogram(binwidth = 2, fill = "lightblue", color = "black", alpha = 0.7) +
  labs(title = "Figure 2: Distribution of Scores", x = "Score", y = "Frequency") +
  theme(plot.title = element_text(hjust = 0.5))

ggsave("Fig_his.png", plot = Fig_his, path = "./output/figure", width = 10, height = 8, dpi = 300)

# Boxplot for score group by property type
Fig_boxplot <- ggplot(apartment_clean, aes(y = SCORE, fill = PROPERTY_TYPE)) +
  geom_boxplot() +
  labs(title = "Figure 3: Boxplot of Scores by Group", x = "Property type", y = "Score") +
  theme(plot.title = element_text(hjust = 0.5))

ggsave("Fig_boxplot.png", plot = Fig_boxplot, path = "./output/figure", width = 10, height = 8, dpi = 300)

