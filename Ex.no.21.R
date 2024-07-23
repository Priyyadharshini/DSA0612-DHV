library(ggplot2)
data <- data.frame(
  Week = as.Date(c("2023-01-01", "2023-01-01", "2023-01-01", 
                   "2023-01-08", "2023-01-08", "2023-01-08", 
                   "2023-01-15", "2023-01-15", "2023-01-15")),
  City = c("New York", "Los Angeles", "Chicago", 
           "New York", "Los Angeles", "Chicago", 
           "New York", "Los Angeles", "Chicago"),
  AvgTemp = c(-2, 15, -5, 0, 17, -3, 2, 18, -2)
)
ggplot(data, aes(x = Week, y = AvgTemp, color = City, group = City)) +
  geom_line() +
  geom_point() +
  labs(title = "Weekly Average Temperatures",
       x = "Week",
       y = "Average Temperature (°C)") +
  theme_minimal()
