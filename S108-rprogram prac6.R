install.packages("dplyr") 
library(dplyr)

midterm <- data.frame(
  Student_ID = c(101, 102, 103),
  Name = c("Aarya", "Bhavin", "Chirag"),
  Midterm_Score = c(78, 85, 92)
)

final <- data.frame(
  Student_ID = c(101, 102, 103),
  Name = c("Aarya", "Bhavin", "Chirag"),
  Final_Score = c(81, 88, 95)
)

new_students <- data.frame(
  Student_ID = c(104, 105),
  Name = c("Disha", "Eshan"),
  Midterm_Score = c(74, 80)
)

print("--- Midterm Exam Data ---")
print(midterm)

print("--- Final Exam Data ---")
print(final)

merged_data <- merge(midterm, final, by = c("Student_ID", "Name"))
print("--- Merged Data (Columns Added) ---")
print(merged_data)

final_list <- bind_rows(midterm, new_students)
print("--- Appended Data (Rows Added) ---")
print(final_list)
