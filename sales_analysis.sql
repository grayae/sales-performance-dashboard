-- ==============================
-- Exploratory Data Analysis: Inspect data, Check for missing values in important columns, Check that Ship Date is not Before Order Date, Check for duplicate Row_IDs and Check for Missing Postal Codes.
-- ==============================
 
SELECT * FROM sales LIMIT 10;

PRAGMA table_info(sales);
 
SELECT 
    SUM(CASE WHEN Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Order_ID,
    SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Order_Date,
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Customer_ID
FROM sales;
 
SELECT * FROM sales WHERE Order_Date > Ship_Date;
 
SELECT Row_ID, COUNT(*) 
FROM sales
GROUP BY Row_ID
HAVING COUNT(*) > 1;
 
SELECT COUNT(*) AS Missing_Postal_Code FROM sales WHERE Postal_Code IS NULL;

-- ==============================
-- Data Cleaning: Rename columns, Remove invalid dates then verify, Replace missing postal codes with a default value and Standardize Customer names and Ship Mode.
-- ==============================

ALTER TABLE sales RENAME COLUMN "Row ID" TO Row_ID;
ALTER TABLE sales RENAME COLUMN "Order ID" TO Order_ID;
ALTER TABLE sales RENAME COLUMN "Order Date" TO Order_Date;
ALTER TABLE sales RENAME COLUMN "Ship Mode" TO Ship_Mode;
ALTER TABLE sales RENAME COLUMN "Ship Date" TO Ship_Date;
ALTER TABLE sales RENAME COLUMN "Customer ID" TO Customer_ID;
ALTER TABLE sales RENAME COLUMN "Customer Name" TO Customer_Name;
ALTER TABLE sales RENAME COLUMN "Postal Code" TO Postal_Code;
ALTER TABLE sales RENAME COLUMN "Product ID" TO Product_ID;
ALTER TABLE sales RENAME COLUMN "Product Name" TO Product_Name;
ALTER TABLE sales RENAME COLUMN "Sub-Category" TO Sub_Category;
 
DELETE FROM sales WHERE Order_Date > Ship_Date;
 
SELECT COUNT(*) FROM sales WHERE Order_Date > Ship_Date;
 
UPDATE sales SET Postal_Code = 5401 WHERE Postal_Code IS NULL;

UPDATE sales SET Customer_Name = TRIM(Customer_Name);
 
UPDATE sales SET Ship_Mode = LOWER(Ship_Mode);

-- ==============================
-- Data Transformation: Change date format to Date type then verify, convert date to date format, Remove old text-based date columns and Rename new date columns.
-- ==============================

UPDATE sales 
SET Order_Date = 
    CASE 
        WHEN LENGTH(Order_Date) = 10 THEN 
            SUBSTR(Order_Date, 7, 4) || '-' || SUBSTR(Order_Date, 4, 2) || '-' || SUBSTR(Order_Date, 1, 2)
        ELSE Order_Date 
    END,
    Ship_Date = 
    CASE 
        WHEN LENGTH(Ship_Date) = 10 THEN 
            SUBSTR(Ship_Date, 7, 4) || '-' || SUBSTR(Ship_Date, 4, 2) || '-' || SUBSTR(Ship_Date, 1, 2)
        ELSE Ship_Date 
    END
WHERE Order_Date IS NOT NULL AND Ship_Date IS NOT NULL;
 
SELECT Order_Date, Ship_Date, typeof(Order_Date), typeof(Ship_Date) FROM sales LIMIT 5;
 
ALTER TABLE sales ADD COLUMN Order_Date_Converted DATE;
ALTER TABLE sales ADD COLUMN Ship_Date_Converted DATE;

UPDATE sales 
SET Order_Date_Converted = DATE(Order_Date),
    Ship_Date_Converted = DATE(Ship_Date);
 
ALTER TABLE sales DROP COLUMN Order_Date;
ALTER TABLE sales DROP COLUMN Ship_Date;

ALTER TABLE sales RENAME COLUMN Order_Date_Converted TO Order_Date;
ALTER TABLE sales RENAME COLUMN Ship_Date_Converted TO Ship_Date;

-- ==============================
-- Final Cleanup: Check for negative sales values, impossible postal codes (too short or long), find duplicate orders then remove them except one and drop column Row_ID.
-- ==============================

SELECT * FROM sales WHERE Sales < 0;

SELECT Postal_Code FROM sales WHERE LENGTH(Postal_Code) NOT BETWEEN 4 AND 10;

SELECT Order_ID, Product_ID, Customer_ID, Sales, COUNT(*) AS Duplicate_Count
FROM sales
GROUP BY Order_ID, Product_ID, Customer_ID, Sales
HAVING COUNT(*) > 1
ORDER BY Duplicate_Count DESC;

DELETE FROM sales 
WHERE Row_ID NOT IN (
    SELECT MIN(Row_ID) 
    FROM sales 
    GROUP BY Order_ID, Product_ID, Customer_ID, Sales
);

ALTER TABLE sales DROP COLUMN Row_ID;

-- Export to Power BI  
