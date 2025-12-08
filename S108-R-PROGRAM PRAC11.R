library(dplyr)
library(tidyr)

df <- read.csv("local_authority_traffic.csv", na.strings = c("", "NA")) %>%
  mutate(RowID = row_number())   

print("--- 1. Original Wide Data ---")
print(head(df))

long_df <- df %>%
  pivot_longer(
    cols = c(link_length_km, link_length_miles, cars_and_taxis, all_motor_vehicles),
    names_to = "Metric",
    values_to = "Value"
  )

print("--- 2. Long Format (pivot_longer) ---")
print(head(long_df, 10))

wide_df <- long_df %>%
  pivot_wider(
    names_from = Metric,
    values_from = Value
  )

print("--- 3. Wide Format (Back to Original) ---")
print(head(wide_df))

authority_pivot <- df %>%
  select(RowID, local_authority_name, link_length_km) %>%
  pivot_wider(
    names_from = local_authority_name,
    values_from = link_length_km
  )

print("--- 4. Local Authority Pivot (Columns = Authority Names) ---")
print(head(authority_pivot))
