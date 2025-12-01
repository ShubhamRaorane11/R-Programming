install.packages("tidyr")
library(dplyr)
library(tidyr)

video_df <- read.csv("video_data.csv", na.strings = c("", "NA"))

print("--- 1. Original Data ---")
print(head(video_df))

print("--- Count of Missing Values per Column ---")
print(colSums(is.na(video_df)))

clean_omit <- na.omit(video_df)

print("--- 2. Data after na.omit() ---")
print(paste("Original rows:", nrow(video_df)))
print(paste("Rows remaining:", nrow(clean_omit)))
print(head(clean_omit))

avg_duration <- mean(video_df$duration_sec, na.rm = TRUE)
avg_views <- mean(video_df$views, na.rm = TRUE)

clean_replace <- video_df %>%
  replace_na(list(
    category = "Unknown",
    likes = 0,
    shares = 0,
    duration_sec = avg_duration,
    views = avg_views
  ))

print("--- 3. Data after replace_na() ---")
print(clean_replace[3, ])
print(head(clean_replace))

print("--- Remaining NAs after replacement ---")
print(colSums(is.na(clean_replace)))
