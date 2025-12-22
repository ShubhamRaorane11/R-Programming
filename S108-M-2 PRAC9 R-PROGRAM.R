data <- read.csv("dataset.csv")
# Step 2: View first few records
head(data)

# Step 3: Create contingency table
contingency_table <- table(
  data$Has.Online.delivery,
  data$Has.Table.booking
)

print(contingency_table)

# Step 4: Apply Chi-Square Test
chi_result <- chisq.test(contingency_table)

print(chi_result)

if (chi_result$p.value < 0.05) {
  cat("Result: Reject H0\n")
  cat("Conclusion: Has Online Delivery and Has Table Booking are significantly associated.\n")
} else {
  cat("Result: Fail to Reject H0\n")
  cat("Conclusion: Has Online Delivery and Has Table Booking are independent.\n")
}
