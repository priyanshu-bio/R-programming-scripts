# Automated Exploratory Data Analysis (EDA) Pipeline in R

## Overview
An automated R workflow designed to streamline data cleaning, summary statistics calculation, and multi-parametric visualization for complex biological datasets (1,200 observations across 14 physiological metrics).

## Features
- **Automated Type Detection:** Automatically separates numeric measurements from categorical groups.
- **Statistical Summaries:** Computes Mean, SD, Min, and Max across all parameters simultaneously using `dplyr` and `tidyr`.
- **Faceted Visualization:** Generates density distribution and boxplot panels using `ggplot2`.

## Technologies Used
- **Language:** R
- **Key Packages:** `dplyr`, `tidyr`, `ggplot2`

## How to Run
1. Clone this repository:
   ```bash
   git clone [https://github.com/your-username/Automated-Plant-Health-EDA.git](https://github.com/your-username/Automated-Plant-Health-EDA.git)
   ```
2. Open `scripts/automated_eda.R` in RStudio.
3. Update the file path to point to your CSV dataset and run the script.

## Sample Output
![Distribution Plot](output/eda_plots.png)
