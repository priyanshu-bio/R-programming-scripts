# ==============================================================================
# Description: Automates data cleaning, summary metrics, and plot generation
# ==============================================================================



# 1. Load Required Libraries
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("dplyr")) install.packages("dplyr")
if (!require("tidyr")) install.packages("tidyr")

library(ggplot2)
library(dplyr)
library(tidyr)





# 2. Load Dataset
# Update path as per your data file----⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓⇓----
file_path <- "C:/Users/HP/Downloads/plant_health_data.csv"
data_raw <- read.csv(file_path)


# ==============================================================================
# PHASE 1: DATA INSPECTION & CLEANING
# ==============================================================================



cat("--- DATASET OVERVIEW ---\n")
cat("Total Rows:", nrow(data_raw), "\n")
cat("Total Columns:", ncol(data_raw), "\n\n")



# Clean missing values
data_clean <- na.omit(data_raw)
cat("Rows after removing missing values (NAs):", nrow(data_clean), "\n\n")



# Automatically separate numeric columns from categorical columns
numeric_cols <- data_clean %>% select(where(is.numeric))
categorical_cols <- data_clean %>% select(where(~ is.character(.x) || is.factor(.x)))

cat("Numeric Variables Found:", colnames(numeric_cols), "\n")
cat("Categorical Variables Found:", colnames(categorical_cols), "\n\n")

# ==============================================================================
# PHASE 2: AUTOMATED STATISTICAL SUMMARY
# ==============================================================================





# Calculate Mean, SD, Min, and Max
summary_stats <- data_clean %>%
  summarise(across(where(is.numeric), list(
    Mean = ~ mean(.x, na.rm = TRUE),
    SD   = ~ sd(.x, na.rm = TRUE),
    Min  = ~ min(.x, na.rm = TRUE),
    Max  = ~ max(.x, na.rm = TRUE)
  ))) %>%
  pivot_longer(
    cols = everything(),
    names_to = c("Variable", "Metric"),
    names_pattern = "(.*)_(.*)"
  ) %>%
  pivot_wider(names_from = Metric, values_from = value)

cat("--- AUTOMATED SUMMARY STATISTICS ---\n")
print(summary_stats)





# ==============================================================================
# PHASE 3: AUTOMATED VISUALIZATION GENERATION
# ==============================================================================

# Reshape data into long format
data_long <- data_clean %>%
  pivot_longer(
    cols = where(is.numeric),
    names_to = "Variable",
    values_to = "Value"
  )



# Plot 1: Combined Density Distribution Plot for all numeric parameters
p1 <- ggplot(data_long, aes(x = Value, fill = Variable)) +
  geom_density(alpha = 0.5) +
  facet_wrap(~ Variable, scales = "free") +
  theme_minimal() +
  theme(legend.position = "none") +
  labs(
    title = "Automated Parameter Distributions",
    subtitle = "Faceted density plots for all numeric features",
    x = "Value",
    y = "Density"
  )

print(p1)


# Plot 2: Boxplots grouped by a categorical status 
if ("Plant_Health_Status" %in% colnames(data_clean)) {
  p2 <- ggplot(data_long, aes(x = Plant_Health_Status, y = Value, fill = Plant_Health_Status)) +
    geom_boxplot(alpha = 0.7, outlier.shape = NA) +
    facet_wrap(~ Variable, scales = "free_y") +
    theme_classic() +
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1),
      legend.position = "none"
    ) +
    labs(
      title = "Parameter Comparison Across Health Status",
      x = "Health Status",
      y = "Measured Value"
    )
  
  print(p2)
}

