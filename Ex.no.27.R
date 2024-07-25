library(scatterplot3d)
library(plotly)

# Create data frame
data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05")),
  StockPrice = c(100, 102, 98, 105, 108),
  VolumeTraded = c(2.5, 3.0, 2.2, 2.8, 3.5),
  MarketCap = c(500, 510, 490, 525, 540)
)

# Correlation analysis
cor(data$StockPrice, data$VolumeTraded)
cor(data$StockPrice, data$MarketCap)

# 3D scatter plot
scatterplot3d(data$VolumeTraded, data$MarketCap, data$StockPrice, pch = 19, 
              xlab = "Volume Traded (millions)", ylab = "Market Cap ($)", zlab = "Stock Price ($)", 
              main = "3D Scatter Plot")

# 3D scatter plot using plotly for interactive visualization
plot_ly(data, x = ~VolumeTraded, y = ~MarketCap, z = ~StockPrice, type = 'scatter3d', mode = 'markers') %>%
  layout(scene = list(xaxis = list(title = 'Volume Traded (millions)'),
                      yaxis = list(title = 'Market Cap ($)'),
                      zaxis = list(title = 'Stock Price ($)'),
                      title = '3D Scatter Plot'))

# 3D surface plot
surface_data <- expand.grid(VolumeTraded = seq(min(data$VolumeTraded), max(data$VolumeTraded), length.out = 50),
                            StockPrice = seq(min(data$StockPrice), max(data$StockPrice), length.out = 50))
surface_data$MarketCap <- 500 * surface_data$StockPrice / 100

plot_ly(surface_data, x = ~VolumeTraded, y = ~StockPrice, z = ~MarketCap, type = 'surface') %>%
  layout(scene = list(xaxis = list(title = 'Volume Traded (millions)'),
                      yaxis = list(title = 'Stock Price ($)'),
                      zaxis = list(title = 'Market Cap ($)'),
                      title = '3D Surface Plot'))

# 3D scatter plots for Stock Price vs Volume Traded and Market Cap separately
plot_ly(data, x = ~VolumeTraded, y = ~StockPrice, z = ~MarketCap, type = 'scatter3d', mode = 'markers') %>%
  layout(scene = list(xaxis = list(title = 'Volume Traded (millions)'),
                      yaxis = list(title = 'Stock Price ($)'),
                      zaxis = list(title = 'Market Cap ($)'),
                      title = 'Stock Price vs Volume Traded'))

plot_ly(data, x = ~MarketCap, y = ~StockPrice, z = ~VolumeTraded, type = 'scatter3d', mode = 'markers') %>%
  layout(scene = list(xaxis = list(title = 'Market Cap ($)'),
                      yaxis = list(title = 'Stock Price ($)'),
                      zaxis = list(title = 'Volume Traded (millions)'),
                      title = 'Stock Price vs Market Cap'))
