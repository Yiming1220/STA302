### Preamble ###
# Purpose: Model dataset about apartment building evaluation in Toronto
# Author: Yiming Tang
# Date: 21 January 2023
# Contact: ym.tang@mail.utoronto.ca

# load library
library(corrplot)

# Correlation research
apartment_clean<- read.csv(apartment_clean_path)

# check correlation totally
plot_cor<- cor(apartment_clean[,-2])
summary(apartment_clean)

# # Visualization
# plot_cor <- round(plot_cor, digits = 4)
# class(plot_cor)
# Fig_cor<- corrplot(plot_cor, method = "color", tl.cex = 0.7, tl.col = "black")

# Scatter plot
Fig_Scatter <- ggplot(apartment_clean, aes(x = ENTRANCE_LOBBY, y = SCORE)) +
  geom_point(col = "red") +
  labs(title = "Scatter Plot for score vs entrance lobby", 
       x = "Number of entrance lobby", y = "Score") +
  geom_smooth(method = "lm", se = FALSE, color = "black") 

ggsave("Fig_Scatter_plot.png", plot = Fig_Scatter, path = "./output/figure", width = 10, height = 6, dpi = 300)

