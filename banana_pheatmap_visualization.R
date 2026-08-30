# 1. Load Required Libraries
library(ggplot2)
library(dplyr)
library(tidyr)
if (!require("pheatmap")) install.packages("pheatmap")
library(pheatmap)


r <- read.csv("D:/state_wise_banana_climate.csv")





test_data <- r[, c("Avg_Temp_C", "Avg_Humidity_Pct", "Annual_Rainfall_mm", "Soil_pH", "Avg_Wind_Speed_kmh", "Avg_Yield_Tons_Ha")]
rownames(test_data) <- r$State
test_matrix <- as.matrix(test_data)


pheatmap(
  test_matrix, 
  scale = "column",
  display_numbers =TRUE,
  clustering_distance_rows = "correlation",
  color = colorRampPalette(c("navy", "white", "firebrick3"))(50),
  main = "State-Wise Climatic & Yield Heatmap"
)

