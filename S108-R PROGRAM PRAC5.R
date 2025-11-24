library(dplyr)

sleep <- read.csv("Sleep_health.csv")

sleep_sorted_duration <- sleep |>
  arrange(Sleep.Duration)
head(sleep_sorted_duration, 5)

sleep_sorted_stress_desc <- sleep |>
  arrange(desc(Stress.Level))
head(sleep_sorted_stress_desc, 5)

sleep_multi_sort <- sleep |>
  arrange(Gender, desc(Sleep.Duration))
head(sleep_multi_sort, 10)

long_sleep_by_quality <- sleep |>
  filter(Sleep.Duration > 8) |>
  arrange(Quality.of.Sleep)

cat("Top 5 longest sleepers with lowest sleep quality:\n")
print(long_sleep_by_quality |> select(Sleep.Duration, Quality.of.Sleep, Age) |> head(5))
