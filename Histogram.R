library(ggplot2)
library(dplyr)
file_path <- "/Users/parthsojitra/Downloads/30-Auto-theft.csv"
data <- read.csv(file_path)
data$Auto_Theft_Recovered <- as.numeric(data$Auto_Theft_Recovered)
stats <- data %>%
  group_by(Area_Name) %>%
  summarise(
    mean_recovered = mean(Auto_Theft_Recovered, na.rm = TRUE),
    sd_recovered = sd(Auto_Theft_Recovered, na.rm = TRUE)
  )
data <- merge(data, stats, by = "Area_Name")
ggplot(data, aes(x = Auto_Theft_Recovered, fill = Area_Name, color = Area_Name)) +
  geom_histogram(aes(y = ..density..), position = "identity", alpha = 0.4, binwidth = 5) +
  stat_function(
    fun = dnorm,
    args = list(mean = mean(data$Auto_Theft_Recovered[data$Area_Name == unique(data$Area_Name)[1]], na.rm = TRUE),
                sd = sd(data$Auto_Theft_Recovered[data$Area_Name == unique(data$Area_Name)[1]], na.rm = TRUE)),
    color = scales::hue_pal()(3)[1], size = 1
  ) +
  stat_function(
    fun = dnorm,
    args = list(mean = mean(data$Auto_Theft_Recovered[data$Area_Name == unique(data$Area_Name)[2]], na.rm = TRUE),
                sd = sd(data$Auto_Theft_Recovered[data$Area_Name == unique(data$Area_Name)[2]], na.rm = TRUE)),
    color = scales::hue_pal()(3)[2], size = 1
  ) +
  stat_function(
    fun = dnorm,
    args = list(mean = mean(data$Auto_Theft_Recovered[data$Area_Name == unique(data$Area_Name)[3]], na.rm = TRUE),
                sd = sd(data$Auto_Theft_Recovered[data$Area_Name == unique(data$Area_Name)[3]], na.rm = TRUE)),
    color = scales::hue_pal()(3)[3], size = 1
  ) +
  labs(
    title = "Histogram with Bell Curve Overlays",
    x = "Auto Theft Recovered (Units)",
    y = "Density"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14)
  )