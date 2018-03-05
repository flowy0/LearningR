

#order randomly and create datasets

# Shuffle row indices: rows
rows <- sample(nrow(Sonar))

# Randomly order data: Sonar
Sonar <- Sonar[rows, ]

# Identify row to split on: split
split <- round(nrow(Sonar) * .60)

# Create train
train <- Sonar[1:split, ]

# Create test
test <- Sonar[(split + 1):nrow(Sonar), ]

#Logistic Regression - Classification

#Be sure to pass the argument family = "binomial" to glm() to specify that you want to do logistic (rather than linear) regression.


# Fit glm model: model
model <- glm(Class ~ . ,family="binomial", train)

# Predict on test: p
p<- predict(model,test, type="response")