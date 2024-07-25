library(plotly)
library(akima)

# Data
location <- c("A", "B", "C", "D", "E")
temperature <- c(15, 20, 18, 12, 17)
humidity <- c(65, 70, 68, 60, 72)
CO2_levels <- c(400, 450, 420, 380, 430)

# Create a data frame
data <- data.frame(location, temperature, humidity, CO2_levels)

# 3D Scatter Plot (Temperature, Humidity, CO2 Levels)
fig_scatter <- plot_ly(data, x = ~temperature, y = ~humidity, z = ~CO2_levels, type = 'scatter3d', mode = 'markers', text = ~location)
fig_scatter <- fig_scatter %>% layout(scene = list(xaxis = list(title = 'Temperature (°C)'),
                                                   yaxis = list(title = 'Humidity (%)'),
                                                   zaxis = list(title = 'CO2 Levels (ppm)')))
fig_scatter

# Interpolate data for 3D Surface Plot
interp_data <- with(data, interp(x = temperature, y = humidity, z = CO2_levels, duplicate = "mean"))

# 3D Surface Plot
fig_surface <- plot_ly(x = interp_data$x, y = interp_data$y, z = interp_data$z, type = "surface")
fig_surface <- fig_surface %>% layout(scene = list(xaxis = list(title = 'Temperature (°C)'),
                                                   yaxis = list(title = 'Humidity (%)'),
                                                   zaxis = list(title = 'CO2 Levels (ppm)')))
fig_surface

# 3D Scatter Plot (CO2 Levels vs Temperature)
fig_temp <- plot_ly(data, x = ~temperature, y = ~CO2_levels, z = ~humidity, type = 'scatter3d', mode = 'markers', text = ~location)
fig_temp <- fig_temp %>% layout(scene = list(xaxis = list(title = 'Temperature (°C)'),
                                             yaxis = list(title = 'CO2 Levels (ppm)'),
                                             zaxis = list(title = 'Humidity (%)')))
fig_temp

# 3D Scatter Plot (CO2 Levels vs Humidity)
fig_humidity <- plot_ly(data, x = ~humidity, y = ~CO2_levels, z = ~temperature, type = 'scatter3d', mode = 'markers', text = ~location)
fig_humidity <- fig_humidity %>% layout(scene = list(xaxis = list(title = 'Humidity (%)'),
                                                     yaxis = list(title = 'CO2 Levels (ppm)'),
                                                     zaxis = list(title = 'Temperature (°C)')))
fig_humidity


