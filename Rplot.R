library(ggplot2)
library(readr)

url <- "https://raw.githubusercontent.com/rahul-1195/A250-DS-304/main/Auto_theft%20.csv"
auto_theft_data <- read_csv(url)
auto_theft_data$Area_Name <- as.factor(auto_theft_data$Area_Name)
auto_theft_data$Auto_Theft_Recovered <- as.numeric(auto_theft_data$Auto_Theft_Recovered)

ggplot(auto_theft_data, aes(x = Area_Name, y = Auto_Theft_Recovered, fill = Area_Name)) +
  geom_boxplot(outlier.color = "red", outlier.shape = 16, alpha = 0.7) +
  labs(
    title = "Box Plot of Auto Theft Recovered by Area Name",
    x = "Area Name",
    y = "Auto Theft Recovered"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "none"
  )