library(ggplot2)
library(readr)

data <- read_csv("StudentsPerformance.csv")

ggplot(data, aes(x = `math score`)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(
    title = "Histogram of Math Scores",
    x = "Math Score",
    y = "Frequency"
  ) +
  theme_minimal()

ggplot(data, aes(x = gender, y = `math score`, fill = gender)) +
  geom_boxplot() +
  labs(
    title = "Box Plot of Math Scores by Gender",
    x = "Gender",
    y = "Math Score"
  ) +
  theme_minimal()
