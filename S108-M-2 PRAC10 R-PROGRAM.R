install.packages("ggplot2")
install.packages("dplyr")
install.packages("readr")

# Load libraries
library(ggplot2)
library(dplyr)
library(readr)
data <- read_csv("Sleep_health_and_lifestyle_dataset.csv")

# View dataset
head(data)
str(data)

ggplot(data, aes(x = Gender)) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Gender Distribution",
    x = "Gender",
    y = "Count"
  ) +
  theme_minimal()

ggplot(data, aes(x = `Sleep Duration`)) +
  geom_histogram(binwidth = 0.5, fill = "darkgreen", color = "black") +
  labs(
    title = "Distribution of Sleep Duration",
    x = "Sleep Duration (Hours)",
    y = "Frequency"
  ) +
  theme_minimal()

ggplot(data, aes(x = `Sleep Duration`, y = `Stress Level`)) +
  geom_point(color = "red") +
  labs(
    title = "Sleep Duration vs Stress Level",
    x = "Sleep Duration (Hours)",
    y = "Stress Level"
  ) +
  theme_minimal()
