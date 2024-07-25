# Load necessary libraries
library(ggplot2)
library(plotly)
library(reshape2)

# Data
data <- data.frame(
  Date = as.Date(c('2023-01-01', '2023-01-02', '2023-01-03', '2023-01-04', '2023-01-05')),
  Temperature = c(10, 12, 8, 15, 14),
  Humidity = c(75, 70, 80, 65, 72),
  WindSpeed = c(15, 12, 18, 20, 16)
)

# 1. How does temperature vary with humidity and wind speed over the recorded dates?
correlation_matrix <- cor(data[, c("Temperature", "Humidity", "WindSpeed")])
print(correlation_matrix)

# 2. Visualize the relationship between wind speed and humidity, considering temperature as the third dimension
ggplot(data, aes(x = WindSpeed, y = Humidity, color = Temperature)) +
  geom_point(size = 4) +
  scale_color_gradient(low = "blue", high = "red") +
  labs(title = "Wind Speed vs Humidity (Temperature as Color)",
       x = "Wind Speed (km/h)", y = "Humidity (%)", color = "Temperature (°C)")

# 3. Discernible pattern between temperature, humidity, and wind speed
# This can be observed from the correlation matrix printed earlier

# 4. Create a 3D surface plot to show how temperature changes with varying levels of humidity and wind speed
# Reshape the data for 3D plotting
humidity_values <- unique(data$Humidity)
wind_speed_values <- unique(data$WindSpeed)
temperature_matrix <- matrix(data$Temperature, nrow = length(humidity_values), ncol = length(wind_speed_values))

fig <- plot_ly(x = humidity_values, y = wind_speed_values, z = temperature_matrix, type = 'surface')

fig <- fig %>%
  layout(scene = list(xaxis = list(title = 'Humidity (%)'),
                      yaxis = list(title = 'Wind Speed (km/h)'),
                      zaxis = list(title = 'Temperature (°C)')),
         title = '3D Surface Plot: Temperature vs Humidity and Wind Speed')

fig

# 5. Compare the 3D plots of temperature against both humidity and wind speed separately
# 3D plot: Temperature vs Humidity
fig1 <- plot_ly(data, x = ~Humidity, y = ~Temperature, z = ~WindSpeed, type = 'scatter3d', mode = 'markers',
                marker = list(size = 5, color = ~Temperature, colorscale = 'Viridis'))

fig1 <- fig1 %>%
  layout(scene = list(xaxis = list(title = 'Humidity (%)'),
                      yaxis = list(title = 'Temperature (°C)'),
                      zaxis = list(title = 'Wind Speed (km/h)')),
         title = '3D Plot: Temperature vs Humidity')

fig1

# 3D plot: Temperature vs Wind Speed
fig2 <- plot_ly(data, x = ~WindSpeed, y = ~Temperature, z = ~Humidity, type = 'scatter3d', mode = 'markers',
                marker = list(size = 5, color = ~Temperature, colorscale = 'Viridis'))

fig2 <- fig2 %>%
  layout(scene = list(xaxis = list(title = 'Wind Speed (km/h)'),
                      yaxis = list(title = 'Temperature (°C)'),
                      zaxis = list(title = 'Humidity (%)')),
         title = '3D Plot: Temperature vs Wind Speed')

fig2
