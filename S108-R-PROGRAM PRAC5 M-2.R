print("--- 5. Independent Two-Sample t-test ---")

df <- read.csv("github_trending_repos.csv")

df$Star_Group <- ifelse(df$stars >= median(df$stars, na.rm = TRUE),
                        "High_Stars",
                        "Low_Stars")

t_test_two <- t.test(forks ~ Star_Group, data = df)

print(t_test_two)
