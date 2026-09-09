CREATE DATABASE SUPERSTORE_DB;
USE superstore_db;

CREATE TABLE cleanedsalesdata (
    row_id INT,
    order_id VARCHAR(50),
    order_date VARCHAR(20),
    ship_date VARCHAR(20),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales VARCHAR(50),
    quantity VARCHAR(20),
    discount VARCHAR(20),
    profit VARCHAR(50)
);
SET GLOBAL local_infile = 1;
LOAD DATA LOCAL INFILE 'C:/Users/dell/Desktop/Data Analyst project/cleanedsalesdata.csv'
INTO TABLE cleanedsalesdata
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
SELECT COUNT(*) FROM cleanedsalesdata;
SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM cleanedsalesdata;
SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM cleanedsalesdata
GROUP BY category
ORDER BY total_sales DESC;
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM cleanedsalesdata
GROUP BY region
ORDER BY total_sales DESC;
SELECT
    `product_name`,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM cleanedsalesdata
GROUP BY `product_name`
ORDER BY total_sales DESC
LIMIT 10;
SELECT
    `product_name`,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM cleanedsalesdata
GROUP BY `product_name`
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;

SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT row_id) AS unique_row_ids
FROM cleanedsalesdata;
TRUNCATE TABLE cleanedsalesdata;
LOAD DATA LOCAL INFILE 'C:/Users/dell/Desktop/Data Analyst project/cleanedsalesdata.csv'
INTO TABLE cleanedsalesdata
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
SELECT COUNT(*) AS total_rows
FROM cleanedsalesdata;
SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT `order_id`) AS total_orders
FROM cleanedsalesdata;
