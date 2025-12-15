print("--- 6. Paired t-test ---")

df <- read.csv("Winter_Fashion_Trends_Dataset.csv")

# 1. Create simulated paired data
df$Discounted_Price <- df$Price - runif(nrow(df), min = 5, max = 20)

# 2. Perform paired t-test
t_test_paired <- t.test(df$Price,
                        df$Discounted_Price,
                        paired = TRUE)

print(t_test_paired)
