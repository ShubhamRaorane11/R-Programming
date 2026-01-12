data <- read.csv("Call_Center_data.csv")
numeric_data <- data[sapply(data, is.numeric)]
cor_matrix <- cor(numeric_data)
print(cor_matrix)
