# Sales Performance Dashboard  
A Power BI Sales Performance Dashboard using SQL and public sales data. 

## Overview  
This project analyzes sales data from the Kaggle Superstore Sales Dataset using SQL for data preparation and Power BI + DAX for calculations and visualizations. It includes key business insights such as revenue trends, top-selling products, geographic performance and customer analysis.  

## Skills Demonstrated  
- SQL: Data cleaning, handling missing values, date formatting and transformations.  
- Power BI & DAX: KPI calculations, visualizations and interactive dashboard design.  

## Tools Used  
- SQL: Data extraction and preparation  
- Power BI:  Dashboard and KPI calculations  
- DAX: Custom calculations & aggregations  
- CSV Dataset: Public dataset from Kaggle  

## Process Summary  
### Data Preparation (SQL)  
- Explored and cleaned raw sales data.  
- Standardized column names and handled missing values.  
- Removed duplicates and fixed date fields to the correct type.  
- Exported the cleaned dataset to Power BI.  

### Dashboard Creation (Power BI)  
- Imported cleaned data and created key performance metrics using DAX (including Total Sales, YoY Growth, Running Sales, Average Order Value etc.).  
- Built visualizations to analyze revenue, product performance, customer trends and geographic analysis.  
- Designed an interactive dashboard with filters for deeper insights.

## Key Insights and Recommendations 
### Key Insights
**Sales Trends:**
- Overall sales increased by 46.91% YoY, with the highest growth in the West region in 2018.
- The rolling 3-month average shows a seasonal sales pattern, peaking in September to December.
  
#### **Product Performance:**
- Canon ImageCLASS 2200 Advanced Copier is the best-selling product ($61.6K in sales).
- The Office Supplies Category underperforms which suggests a need for promotions or product adjustments.
  
#### **Geographic Insights:**
- The West region generates the highest revenue which suggests a strong customer base.
- New York City contributes the most to total sales while Ormond Beach contributes the least.

### Recommendations
-  Focus marketing efforts on high-growth product categories like Technology.
-  Consider expanding in high-performing regions like New York City in the West region.
-  Offer loyalty incentives to high-value customers to maximize retention.

## Files In This Repository  
- **Sales Performance Dashboard.pdf:** Final Power BI report.  
- **sales_analysis.sql:** SQL queries for data preparation.  
- **cleaned_sales.csv:** Processed dataset used in Power BI.  
- **Kaggle Superstore Sales Dataset.csv:** Raw sales data.  
- **README.md:** Project documentation.  
- **Screenshots of the dashboard and geographic analysis pages.**  

## Preview  
- Dashboard Page (https://github.com/grayae/sales-performance-dashboard/blob/main/Overview%20Page.png)
- Geographic Analysis Page (https://github.com/grayae/sales-performance-dashboard/blob/main/Geographic%20Analysis%20Page.png)

## How to Use 
- Open sales_analysis.sql to review data cleaning and transformation steps.
-  View Sales Performance Dashboard.pdf to see the final insights.
