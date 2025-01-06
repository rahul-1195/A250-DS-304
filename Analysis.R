# Load necessary libraries
library(ggplot2)
library(readr)
library(dplyr)

# The dataset
url <- "https://raw.githubusercontent.com/rahul-1195/A250-DS-304/main/Auto_theft%20.csv"
auto_theft_data <- read_csv(url)

# Filter out totals or summaries
filtered_data <- auto_theft_data %>%
  filter(!Area_Name %in% c("Total", "Overall", "Summary")) %>%
  mutate(Auto_Theft_Recovered = as.numeric(Auto_Theft_Recovered)) %>%
  filter(!is.na(Auto_Theft_Recovered))

# Run the analysis on filtered data
summary_stats <- filtered_data %>%
  group_by(Area_Name) %>%
  summarise(
    Mean = mean(Auto_Theft_Recovered, na.rm = TRUE),
    Median = median(Auto_Theft_Recovered, na.rm = TRUE),
    SD = sd(Auto_Theft_Recovered, na.rm = TRUE),
    Count = n()
  )
print("Summary Statistics for Raw Data Points:")
print(summary_stats)

# Visualization
ggplot(filtered_data, aes(x = Auto_Theft_Recovered, y = Area_Name, fill = Area_Name)) +
  geom_boxplot(outlier.color = "red", outlier.shape = 16, alpha = 0.7) +
  labs(
    title = "Box Plot of Auto Theft Recovered by Area Name",
    x = "Auto Theft Recovered (Units)",
    y = "Area Name"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14),
    legend.position = "none"
  )