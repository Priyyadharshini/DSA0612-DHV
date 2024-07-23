library(ggplot2)
library(hexbin)
data <- data.frame(
  Date = as.Date(c('2023-01-01', '2023-01-02', '2023-01-03', '2023-01-04', '2023-01-05', '2023-01-06', '2023-01-07')),
  Likes = c(150, 200, 250, 300, 350, 400, 450),
  Comments = c(20, 25, 30, 35, 40, 45, 50),
  Shares = c(30, 35, 40, 45, 50, 55, 60)
)
library(reshape2)
data_long <- melt(data, id.vars = "Date")
ggplot(data_long, aes(x = Date, y = value)) +
  geom_hex(bins = 30) +
  facet_wrap(~ variable, scales = "free_y") +
  scale_fill_viridis_c() +
  theme_minimal() +
  labs(title = "Daily Social Media Engagement",
       x = "Date",
       y = "Engagement Count",
       fill = "Count")
