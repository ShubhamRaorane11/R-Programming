
christmas_df <- read.csv("christmas.csv", na.strings = c("", "NA"))

traffic_df <- read.csv("local_authority_traffic.csv", na.strings = c("", "NA"))

print("--- Data Structure Before Transformation ---")
print(names(christmas_df))
print(names(traffic_df))  

christmas_clean <- christmas_df[, c("track", "streams")]
names(christmas_clean) <- c("Category", "Value")

traffic_clean <- traffic_df[, c("local_authority_name", "link_length_km")]
names(traffic_clean) <- c("Category", "Value")

christmas_clean$Value <- as.numeric(christmas_clean$Value)
traffic_clean$Value   <- as.numeric(traffic_clean$Value)

combined_data <- rbind(christmas_clean, traffic_clean)

print("--- Combined Data Summary ---")
print(paste("Christmas rows:", nrow(christmas_clean)))
print(paste("Traffic rows:", nrow(traffic_clean)))
print(paste("Total rows (Expected):", nrow(christmas_clean) + nrow(traffic_clean)))
print(paste("Total rows (Actual):", nrow(combined_data)))

print("--- Preview of Combined Data (Top and Bottom) ---")
print(head(combined_data))
print(tail(combined_data))
