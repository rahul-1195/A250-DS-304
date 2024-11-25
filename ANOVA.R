# Perform ANOVA
anova_result <- aov(Auto_Theft_Recovered ~ Area_Name, data = DF)

# Summarize ANOVA result
summary(anova_result)
If the p-value is less than 0.05, it suggests significant differences between the means.
b. t-Test (for 2 groups only)
If Area_Name has exactly two groups, use a t-test:
  
