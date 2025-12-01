install.packages("stringr")
install.packages("tidyr")

library(stringr)
library(tidyr)
library(dplyr)

traffic_df <- read.csv("local_authority_traffic.csv")

print("--- Original Dataset (First 6 Rows) ---")
print(head(traffic_df))

traffic_df$Name_Start <- str_sub(traffic_df$local_authority_name, 1, 3)
traffic_df$Name_End <- str_sub(traffic_df$local_authority_name, -5, -1)
traffic_df$Year_Str <- str_sub(as.character(traffic_df$year), 1, 4)

print("--- After str_sub() ---")
print(traffic_df %>% select(local_authority_name, Name_Start, Name_End, Year_Str))

split_list <- str_split(traffic_df$local_authority_name, " ")
print("--- Example of split list (first item) ---")
print(split_list[[1]])

split_matrix <- str_split(traffic_df$local_authority_name, " ", simplify = TRUE)

traffic_df$Word1 <- split_matrix[, 1]
traffic_df$Word2 <- split_matrix[, 2]
traffic_df$Word3 <- split_matrix[, 3]

print("--- After str_split() ---")
print(traffic_df %>% select(local_authority_name, Word1, Word2, Word3))

tidy_name <- traffic_df %>%
  separate(local_authority_name, into = c("Part1", "Part2", "Part3"),
           sep = " ", fill = "right", extra = "merge")

print("--- After separate() ---")
print(tidy_name %>% select(Part1, Part2, Part3) %>% head())
