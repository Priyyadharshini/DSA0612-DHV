# Load necessary library
library(ggplot2)
satisfaction_data <- data.frame(
  Category = c("Product Quality", "Customer Service", "Value for Money"),
  Very_Dissatisfied = c(5, 10, 8),
  Dissatisfied = c(15, 20, 12),
  Neutral = c(25, 30, 28),
  Satisfied = c(35, 25, 32),
  Very_Satisfied = c(20, 15, 20)
)
satisfaction_long <- reshape2::melt(satisfaction_data, id.vars = "Category",
                                    variable.name = "Satisfaction_Level",
                                    value.name = "Count")
ggplot(satisfaction_long, aes(x = Category, y = Count, fill = Satisfaction_Level)) +
  geom_bar(stat = "identity") +
  labs(title = "Customer Satisfaction Survey Results",
       x = "Category",
       y = "Count",
       fill = "Satisfaction Level") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set3")
