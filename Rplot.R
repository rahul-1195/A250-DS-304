library(ggplot2)
file_path <- "/Users/parthsojitra/Downloads/30-Auto-theft.csv"
auto_theft_data <- read.csv(file_path, stringsAsFactors = FALSE)
auto_theft_data$Area_Name <- as.factor(auto_theft_data$Area_Name)
auto_theft_data$Auto_Theft_Recovered <- as.numeric(auto_theft_data$Auto_Theft_Recovered)
ggplot(auto_theft_data, aes(x = Area_Name, y = Auto_Theft_Recovered, fill = Area_Name)) +
  geom_boxplot(outlier.color = "red", outlier.shape = 16, alpha = 0.7) +
  labs(
    title = "Box Plot of Auto Theft Recovered by Area Name ",
    x = "Area Name",
    y = "Auto Theft Recovered"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "none" 
  )
