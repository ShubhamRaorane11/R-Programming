# 2. Load dataset
diabetes <- read.csv("diabetes.csv")

# 3. View dataset
head(diabetes)
str(diabetes)
summary(diabetes)

# 4. Convert Outcome to factor (Target Variable)
diabetes$Outcome <- factor(diabetes$Outcome)

# 5. Check for missing values
colSums(is.na(diabetes))

# 6. Exploratory Data Analysis (EDA)
# Count of Outcome
table(diabetes$Outcome)

# 7. Logistic Regression Model
logistic_model <- glm(Outcome ~ Pregnancies + Glucose + BloodPressure +
                        BMI + Age,
                      data = diabetes,
                      family = binomial)

# 8. Model summary
summary(logistic_model)

# 9. Odds Ratios
exp(coef(logistic_model))

# 10. Predict probabilities
predicted_prob <- predict(logistic_model, type = "response")

# 11. Convert probabilities to class labels
predicted_class <- ifelse(predicted_prob > 0.5, 1, 0)

# 12. Confusion Matrix
table(Predicted = predicted_class, Actual = diabetes$Outcome)

# 13. Model Accuracy
accuracy <- mean(predicted_class == diabetes$Outcome)
accuracy
