# Step 1: Load the Data and necessary libraries
library(ggplot2)
library(readr)
library(dplyr)
url <- "https://raw.githubusercontent.com/rahul-1195/A250-DS-304/main/Auto_theft%20.csv"
auto_theft_data <- read_csv(url)

# Step 2: Data Preprocessing
auto_theft_data$Area_Name <- as.factor(auto_theft_data$Area_Name)
auto_theft_data$Auto_Theft_Recovered <- as.numeric(auto_theft_data$Auto_Theft_Recovered)
filtered_data <- auto_theft_data %>%
  filter(Area_Name %in% c("Assam", "Bihar", "Delhi"))

# Step 3: Descriptive Statistics(Mean , Median & SD)
summary_stats <- filtered_data %>%
  group_by(Area_Name) %>%
  summarise(
    Mean = mean(Auto_Theft_Recovered, na.rm = TRUE),
    Median = median(Auto_Theft_Recovered, na.rm = TRUE),
    SD = sd(Auto_Theft_Recovered, na.rm = TRUE),
    Count = n()
  )
print("Summary Statistics:")
print(summary_stats)

# Step 4: Hypothesis Testing
# Null Hypothesis (H₀): No significant difference in recovery rates across areas.
# Alternative Hypothesis (H₁): Significant differences in recovery rates across areas.
normality_tests <- filtered_data %>%
  group_by(Area_Name) %>%
  summarise(
    p_value_shapiro = shapiro.test(Auto_Theft_Recovered)$p.value
  )
print("Shapiro-Wilk Normality Test Results:")
print(normality_tests)
kruskal_test <- kruskal.test(Auto_Theft_Recovered ~ Area_Name, data = filtered_data)
print("Kruskal-Wallis Test Results:")
print(kruskal_test)

# Perform pairwise Wilcoxon Rank Sum tests if Kruskal-Wallis test is significant
if (kruskal_test$p.value < 0.05) {
  pairwise_results <- pairwise.wilcox.test(
    x = filtered_data$Auto_Theft_Recovered,
    g = filtered_data$Area_Name,
    p.adjust.method = "bonferroni"
  )
  print("Pairwise Wilcoxon Rank Sum Test Results:")
  print(pairwise_results)
}

# Step 5: Visualization
ggplot(filtered_data, aes(x = Area_Name, y = Auto_Theft_Recovered, fill = Area_Name)) +
  geom_boxplot(outlier.color = "red", outlier.shape = 16, alpha = 0.7) +
  labs(
    title = "Box Plot of Auto Theft Recovered by Area Name",
    x = "Area Name",
    y = "Auto Theft Recovered (Units)"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "none"
  )