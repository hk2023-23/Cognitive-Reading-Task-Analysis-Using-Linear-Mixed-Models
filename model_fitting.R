# model_fitting.R

# Load required packages
library(lme4)
library(broom.mixed)
library(dplyr)

# Load the dataset
cognitive_data <- read.csv("data/Cognitive.csv", stringsAsFactors = TRUE)

# Convert categorical variables to factors
cognitive_data$S <- as.factor(cognitive_data$S)
cognitive_data$G <- as.factor(cognitive_data$G)
cognitive_data$C <- as.factor(cognitive_data$C)
cognitive_data$W <- as.factor(cognitive_data$W)

# Fit the linear mixed-effects model
model.lmer <- lmer(T ~ G * C * W + (1 + C + W | S), data = cognitive_data)

# View model summary
summary(model.lmer)

# Extract and print fixed effects
fixed_effects <- data.frame(
  term = names(fixef(model.lmer)),
  estimate = round(fixef(model.lmer), 2)
)
print(fixed_effects)
