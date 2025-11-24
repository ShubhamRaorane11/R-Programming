# Install packages (only first time)
install.packages(c("readr", "psych"))

# Load the libraries
library(readr)
library(psych)

# Read your CSV file
my_data <- read.csv("Student-Mental-health.csv")  

View(my_data)

head(my_data)

tail(my_data)

cat("Dimensions: ", dim(my_data), "\n")

str(my_data)

summary(my_data)

cat("Column Names: ", names(my_data), "\n")

describe(my_data)

