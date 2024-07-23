library(ggplot2)
data <- data.frame(
  Month = rep(c("Jan", "Feb", "Mar"), each = 3),
  Employee = rep(c("A", "B", "C"), 3),
  Score = c(85, 90, 80, 88, 92, 90, 90, 80, 82)
)
ggplot(data, aes(x = Score, fill = Employee)) +
  geom_histogram(binwidth = 2,  color = "black") +
  labs(title = "Monthly Performance Scores of Employees",
       x = "Score",
       y = "Count") +
  theme_minimal()
