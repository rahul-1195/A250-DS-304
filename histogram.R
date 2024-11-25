# Load the data (replace with your actual file path)
file_path <- "/Users/parthsojitra/Downloads/Auto_theft.csv"
library(ggplot2)
# Load the data into R
auto_theft_data <- read.csv(file_path, stringsAsFactors = FALSE)

# Check if data is loaded properly
head(auto_theft_data)  # View the first few rows
# Check column names
colnames(auto_theft_data)

# Check the structure of the data
str(auto_theft_data)

# Create histogram using ggplot2 (make sure to adjust column name if necessary)
library(ggplot2)
ggplot(auto_theft_data, aes(x = Auto_Theft_Recovered)) +
  geom_histogram(binwidth = 10, fill = "blue", color = "black", alpha = 0.7) +
  labs(
    title = "Histogram of Auto Theft Recovered",
    x = "Auto Theft Recovered",
    y = "Frequency"
  ) +
  theme_minimal()