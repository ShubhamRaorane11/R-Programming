# Read dataset
reviews <- read.csv("tokopedia_product_reviews_2025.csv")

# Convert categorical variables to factors
reviews$product_category <- as.factor(reviews$product_category)
reviews$sentiment_label <- as.factor(reviews$sentiment_label)

# Two-Way ANOVA
anova_result <- aov(
  rating ~ product_category * sentiment_label,
  data = reviews
)

# Show ANOVA table
anova_summary <- summary(anova_result)
print(anova_summary)

# Extract ANOVA table
anova_table <- anova_summary[[1]]

# Extract p-values safely
p_category <- anova_table["product_category", "Pr(>F)"]
p_sentiment <- anova_table["sentiment_label", "Pr(>F)"]
p_interaction <- anova_table["product_category:sentiment_label", "Pr(>F)"]

# Decision logic (NA-safe)
if (!is.na(p_category) && p_category < 0.05) {
  cat("Reject H01: Product category has a significant effect on ratings.\n")
} else {
  cat("Fail to Reject H01: Product category has no significant effect on ratings.\n")
}

if (!is.na(p_sentiment) && p_sentiment < 0.05) {
  cat("Reject H02: Sentiment label has a significant effect on ratings.\n")
} else {
  cat("Fail to Reject H02: Sentiment label has no significant effect on ratings.\n")
}

if (!is.na(p_interaction) && p_interaction < 0.05) {
  cat("Reject H03: Significant interaction between product category and sentiment.\n")
} else {
  cat("Fail to Reject H03: No significant interaction effect.\n")
}
