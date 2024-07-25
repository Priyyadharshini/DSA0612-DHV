library(plotly)
library(akima)

# Create the data frame
data <- data.frame(
  Product = c("A", "B", "C", "D", "E"),
  Price = c(50, 70, 60, 45, 55),
  Rating = c(4.2, 3.8, 4.0, 4.5, 3.9),
  AgeGroup = c("25-35", "35-45", "18-25", "45-55", "25-35")
)

# Map age groups to numerical values for plotting
data$AgeGroupNum <- as.numeric(factor(data$AgeGroup, levels = unique(data$AgeGroup)))

# Create 3D scatter plot
scatter_plot <- plot_ly(data, x = ~Price, y = ~Rating, z = ~AgeGroupNum, type = "scatter3d", mode = "markers",
                        marker = list(size = 5, color = ~Rating, colorscale = "Viridis", showscale = TRUE)) %>%
  layout(scene = list(xaxis = list(title = "Price ($)"),
                      yaxis = list(title = "Rating"),
                      zaxis = list(title = "Age Group")))
scatter_plot

# Check correlation
correlation_matrix <- cor(data[, c("Price", "Rating", "AgeGroupNum")])
print(correlation_matrix)

# Example data for surface plot, you might need to adjust this for your actual data

# Create grid for interpolation
interp_data <- with(data, interp(x = Price, y = AgeGroupNum, z = Rating, duplicate = "mean"))

# Create 3D surface plot
surface_plot <- plot_ly(z = ~interp_data$z, x = ~interp_data$x, y = ~interp_data$y, type = "surface") %>%
  layout(scene = list(xaxis = list(title = "Price ($)"),
                      yaxis = list(title = "Age Group"),
                      zaxis = list(title = "Rating")))
surface_plot

# 3D scatter plot: Rating vs Price vs Age Group
scatter_plot_price_age <- plot_ly(data, x = ~Price, y = ~Rating, z = ~AgeGroupNum, type = "scatter3d", mode = "markers",
                                  marker = list(size = 5, color = ~Rating, colorscale = "Viridis", showscale = TRUE)) %>%
  layout(scene = list(xaxis = list(title = "Price ($)"),
                      yaxis = list(title = "Rating"),
                      zaxis = list(title = "Age Group")))
scatter_plot_price_age

# 3D scatter plot: Rating vs Age Group vs Price
scatter_plot_age_price <- plot_ly(data, x = ~AgeGroupNum, y = ~Rating, z = ~Price, type = "scatter3d", mode = "markers",
                                  marker = list(size = 5, color = ~Rating, colorscale = "Viridis", showscale = TRUE)) %>%
  layout(scene = list(xaxis = list(title = "Age Group"),
                      yaxis = list(title = "Rating"),
                      zaxis = list(title = "Price ($)")))
scatter_plot_age_price
