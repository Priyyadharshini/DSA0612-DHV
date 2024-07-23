library(plotly)
library(ggplot2)
library(scatterplot3d)
library(akima)

# Weather data
weather_data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05")),
  Temperature = c(10, 12, 8, 15, 14),
  Humidity = c(75, 70, 80, 65, 72),
  WindSpeed = c(15, 12, 18, 20, 16)
)

# 1. Variation of temperature with humidity and wind speed
# Summary statistics
print(summary(weather_data))

# 2. Visualize relationship between wind speed and humidity, considering temperature as the third dimension
plot1 <- plot_ly(weather_data, x = ~Humidity, y = ~WindSpeed, z = ~Temperature, type = 'scatter3d', mode = 'markers') %>%
  layout(scene = list(xaxis = list(title = 'Humidity (%)'),
                      yaxis = list(title = 'Wind Speed (km/h)'),
                      zaxis = list(title = 'Temperature (°C)')))
print(plot1)

# 3. Discern patterns between temperature, humidity, and wind speed
plot2 <- pairs(weather_data[,-1], main = "Pairs Plot of Weather Data")
print(plot2)

# 4. 3D surface plot of temperature, humidity, and wind speed
# Interpolate the data for creating a surface
interp_data <- with(weather_data, interp(x = Humidity, y = WindSpeed, z = Temperature, duplicate = "mean"))

# Plot the 3D surface
plot3 <- plot_ly(x = interp_data$x, y = interp_data$y, z = interp_data$z) %>%
  add_surface() %>%
  layout(scene = list(xaxis = list(title = 'Humidity (%)'),
                      yaxis = list(title = 'Wind Speed (km/h)'),
                      zaxis = list(title = 'Temperature (°C)')))
print(plot3)

# 5. Compare 3D plots of temperature against both humidity and wind speed separately
# Temperature vs. Humidity
plot4 <- plot_ly(weather_data, x = ~Humidity, y = ~Temperature, z = ~WindSpeed, type = 'scatter3d', mode = 'markers') %>%
  layout(scene = list(xaxis = list(title = 'Humidity (%)'),
                      yaxis = list(title = 'Temperature (°C)'),
                      zaxis = list(title = 'Wind Speed (km/h)')))
print(plot4)

# Temperature vs. Wind Speed
plot5 <- plot_ly(weather_data, x = ~WindSpeed, y = ~Temperature, z = ~Humidity, type = 'scatter3d', mode = 'markers') %>%
  layout(scene = list(xaxis = list(title = 'Wind Speed (km/h)'),
                      yaxis = list(title = 'Temperature (°C)'),
                      zaxis = list(title = 'Humidity (%)')))
print(plot5)
