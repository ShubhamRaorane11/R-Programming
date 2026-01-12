
library(ggplot2)
library(dplyr)
library(readr)

# Load dataset
data <- read_csv("health_lifestyle_dataset.csv")

# Peek at data
head(data)
str(data)

### 1) Pie Chart: Gender Distribution
gender_counts <- data %>%
  count(gender)

ggplot(gender_counts, aes(x = "", y = n, fill = gender)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(
    title = "Gender Distribution",
    fill = "Gender"
  ) +
  theme_minimal() +
  theme(
    axis.title = element_blank(),
    axis.text = element_blank(),
    panel.grid = element_blank()
  )

### 2) High–Low Chart: Sleep Hours Range by Gender
sleep_range <- data %>%
  group_by(gender) %>%
  summarise(
    min_sleep = min(sleep_hours, na.rm = TRUE),
    max_sleep = max(sleep_hours, na.rm = TRUE)
  )

ggplot(sleep_range, aes(x = gender)) +
  geom_linerange(
    aes(ymin = min_sleep, ymax = max_sleep),
    color = "steelblue",
    size = 1.5
  ) +
  geom_point(aes(y = min_sleep), color = "darkred", size = 3) +
  geom_point(aes(y = max_sleep), color = "darkgreen", size = 3) +
  labs(
    title = "Sleep Hours Range by Gender",
    x = "Gender",
    y = "Sleep Hours"
  ) +
  theme_minimal()

### 3) Scatter Plot: Sleep Hours vs Daily Steps
ggplot(data, aes(x = sleep_hours, y = daily_steps)) +
  stat_summary(
    fun = mean,
    geom = "point",
    color = "red",
    size = 3
  ) +
  labs(
    title = "Average Daily Steps by Sleep Hours",
    x = "Sleep Hours (avg)",
    y = "Average Daily Steps"
  ) +
  theme_minimal()
