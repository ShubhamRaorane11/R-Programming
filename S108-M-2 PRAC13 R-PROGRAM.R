# 2. Load dataset
insurance <- read.csv("insurance.csv")

# 3. View dataset
head(insurance)
str(insurance)
summary(insurance)

# 4. Convert categorical variables to factors
insurance$sex <- factor(insurance$sex)
insurance$smoker <- factor(insurance$smoker)
insurance$region <- factor(insurance$region)

# 6. Simple Linear Regression
simple_model <- lm(charges ~ age, data = insurance)
summary(simple_model)

# 7. Multiple Linear Regression
multiple_model <- lm(charges ~ age + bmi + children + sex + smoker + region,
                     data = insurance)
summary(multiple_model)

# 8. Diagnostic plots
par(mfrow = c(2,2))
plot(multiple_model)

# 9. Prediction
predicted_charges <- predict(multiple_model, insurance)
head(predicted_charges)

# 10. Model Accuracy (R-squared)
r_squared <- cor(predicted_charges, insurance$charges)^2
r_squared
