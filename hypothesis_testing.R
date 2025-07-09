# hypothesis_testing.R

library(multcomp)

# Define contrast for η = η₁ - η₂
contrast_matrix <- c(
  "(Intercept)" = 1, "G" = 1, "C" = 1, "W" = 1,
  "G:C" = 1, "G:W" = 1, "C:W" = 1, "G:C:W" = 1
)

# Apply general linear hypothesis test
result <- glht(model.lmer, linfct = rbind(contrast_matrix))

# Print the estimate and p-value
summary(result)
