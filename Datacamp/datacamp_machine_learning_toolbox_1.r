# Fit lm model: model
model <- lm(price ~ . , diamonds)

# Predict on full data: p
p <- predict(model, diamonds)

# Compute errors: error
error <- p-diamonds$price


# Calculate RMSE
sqrt(mean((p-diamonds$price)^2))