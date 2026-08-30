<img width="862" height="512" alt="Rplot 002" src="https://github.com/user-attachments/assets/14971d7e-dc58-465e-ab8a-ab3c0a6d895b" />
<img width="862" height="512" alt="Rplot 001" src="https://github.com/user-attachments/assets/8150dc12-0c60-47e5-ad2b-21071ccd1053" />
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
