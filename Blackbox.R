# Load necessary libraries
library(ggplot2)
library(dplyr)
library(readr)

data <- read_csv("D:/Auto_theft .csv")


# Create a boxplot for Auto Theft Recovered by Area Name
ggplot(auto_theft_data, aes(x = Area_Name, y = Auto_Theft_Recovered)) +
  geom_boxplot(fill = "lightblue", color = "black") +
  labs(
    title = "Distribution of Auto Theft Recovered by Area Name",
    x = "Area Name",
    y = "Auto Theft Recovered"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle =45,hjust=1))
