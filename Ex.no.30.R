library(plotly)
library(scatterplot3d)

# Create the data frame
students_data <- data.frame(
  Student = c('A', 'B', 'C', 'D', 'E'),
  Math_Score = c(85, 72, 90, 78, 88),
  Science_Score = c(78, 85, 80, 75, 82),
  Attendance = c(95, 92, 98, 85, 93)
)

# 3D Scatter plot
scatter_plot <- plot_ly(students_data, x = ~Math_Score, y = ~Science_Score, z = ~Attendance, 
                        type = 'scatter3d', mode = 'markers') %>%
  layout(scene = list(xaxis = list(title = 'Math Score'),
                      yaxis = list(title = 'Science Score'),
                      zaxis = list(title = 'Attendance (%)')))

# Display the scatter plot
scatter_plot

# Calculate correlation
correlation_matrix <- cor(students_data[, c("Math_Score", "Science_Score", "Attendance")])
print(correlation_matrix)

# 3D Surface plot
surface_plot <- plot_ly(students_data, x = ~Math_Score, y = ~Attendance, z = ~Science_Score,
                        type = 'mesh3d') %>%
  layout(scene = list(xaxis = list(title = 'Math Score'),
                      yaxis = list(title = 'Attendance (%)'),
                      zaxis = list(title = 'Science Score')))

# Display the surface plot
surface_plot

# Compare Science Score vs Math Score and Attendance
# Science Score vs Math Score
scatterplot3d(students_data$Math_Score, students_data$Science_Score, angle = 45, pch = 16, color = "blue",
              xlab = "Math Score", ylab = "Science Score", zlab = "Attendance (%)")

# Science Score vs Attendance
scatterplot3d(students_data$Attendance, students_data$Science_Score, angle = 45, pch = 16, color = "red",
              xlab = "Attendance (%)", ylab = "Science Score", zlab = "Math Score")
