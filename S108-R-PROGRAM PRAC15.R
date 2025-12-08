flights_df <- read.csv("airlines_flights_data.csv")

print("--- Data Loaded ---")
print(head(flights_df))

print("--- OUTPUT OF str() ---")
str(flights_df)

print("--- OUTPUT OF summary() [Before Factor Conversion] ---")
summary(flights_df)

flights_df$airline <- as.factor(flights_df$airline)
flights_df$source_city <- as.factor(flights_df$source_city)
flights_df$destination_city <- as.factor(flights_df$destination_city)
flights_df$class <- as.factor(flights_df$class)

print("--- OUTPUT OF summary() ---")
summary(flights_df)

avg_duration <- mean(flights_df$duration, na.rm = TRUE)
max_price <- max(flights_df$price, na.rm = TRUE)

print(paste("Average Flight Duration:", avg_duration))
print(paste("Highest Ticket Price:", max_price))
