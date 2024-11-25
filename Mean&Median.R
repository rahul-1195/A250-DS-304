# Install and load readr
install.packages("readr")
library(readr)

# Read the data
data <- read_csv("/Users/parthsojitra/Downloads/Auto_theft.csv'")

# Debugging: Check column names
print("Column Names in Dataset:")
print(colnames(data))

# Check column content
print("Column Content Before Conversion:")
print(data$Auto_Theft_Recovered)

# Convert to numeric if necessary
data$Auto_Theft_Recovered <- as.numeric(data$Auto_Theft_Recovered)

# Check data type after conversion
print("Data Type After Conversion:")
print(class(data$Auto_Theft_Recovered))

# Calculate mean and median
mean_value <- mean(data$Auto_Theft_Recovered, na.rm = TRUE)
median_value <- median(data$Auto_Theft_Recovered, na.rm = TRUE)

# Print results
print(paste("Mean:", mean_value))
print(paste("Median:", median_value))
