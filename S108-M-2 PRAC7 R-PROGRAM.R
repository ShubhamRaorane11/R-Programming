fruits <- read.csv("fruits_dataset.csv")

fruits$season <- as.factor(fruits$season)

# Step 3: Perform One-Way ANOVA
anova_result <- aov(calories ~ season, data = fruits)

# Step 4: Display ANOVA summary
summary(anova_result)

# Step 5: Decision based on p-value
p_value <- summary(anova_result)[[1]][["Pr(>F)"]][1]

if (p_value < 0.05) {
  cat("Result: Reject H0\n")
  cat("Conclusion: Mean calories differ significantly across seasons.\n")
} else {
  cat("Result: Fail to Reject H0\n")
  cat("Conclusion: No significant difference in mean calories across seasons.\n")
}
