install.packages("dplyr")
install.packages("psych")

library(dplyr)
library(psych)

eq <- read.csv("earthquake.csv")
str(eq)
head(eq)

# =============================================================================
# 1. Descriptive Statistics
# =============================================================================
print("--- 1. Descriptive Statistics for Earthquake Data ---")

# A. Using Base R summary()
print("Summary of Earthquake Magnitude (mag):")
summary(eq$mag)

print("Summary of Earthquake Depth (depth):")
summary(eq$depth)

# B. Using psych::describe()
print("Detailed Description of Magnitude and Depth:")
describe(eq[, c("mag", "depth")])

