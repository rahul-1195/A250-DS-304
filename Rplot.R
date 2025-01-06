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