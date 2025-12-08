install.packages("lubridate")
install.packages("dplyr")

library(lubridate)
library(dplyr)

coffee_df <- read.csv("coffe.csv")

print("--- Original Data ---")
print(head(coffee_df))

processed_data <- coffee_df %>%
  mutate(
    Actual_Date = dmy(Date),
    
    Actual_Time = hms(Time),
    
    Year_Num = year(Actual_Date),
    Month_Num = month(Actual_Date),
    Month_Name = month(Actual_Date, label = TRUE),
    
    Day_Num = day(Actual_Date),
    Weekday_Num = wday(Actual_Date),
    Weekday_Name = wday(Actual_Date, label = TRUE, abbr = FALSE),
    
    Quarter = quarter(Actual_Date),
    Day_of_Year = yday(Actual_Date),
    
    Hour = hour(Actual_Time),
    Minute = minute(Actual_Time),
    Second = second(Actual_Time)
  )

print("--- Data with Extracted Date & Time Components ---")
print(head(processed_data))


current_time <- now()

print("--- Current Time Extraction ---")
print(paste("Current Year:", year(current_time)))
print(paste("Current Hour:", hour(current_time)))
print(paste("Current Minute:", minute(current_time)))
