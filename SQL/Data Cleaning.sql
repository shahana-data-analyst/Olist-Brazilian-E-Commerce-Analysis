-- Olist Brazilian E-Commerce Dataset
-- Data Cleaning & Validation


CREATE DATABASE olist_brazilian;
USE olist_brazilian;
SHOW TABLES;

DESCRIBE olist_customers_dataset;
DESCRIBE olist_order_items_dataset;
DESCRIBE olist_order_payments_dataset;
DESCRIBE olist_order_reviews_dataset;
DESCRIBE olist_orders_dataset;
DESCRIBE olist_products_dataset;
DESCRIBE olist_sellers_dataset;
DESCRIBE product_category_name_translation;

-- Data Cleaning,Data type,Duplicate and Null value check and Data validation of Olist Customer Table

ALTER  TABLE olist_customers_dataset
MODIFY customer_id VARCHAR(50),
MODIFY customer_state VARCHAR(50);

SELECT * FROM olist_customers_dataset 
WHERE customer_city <> TRIM(customer_city) OR  customer_state <> TRIM(customer_state);
 
SELECT COUNT(*) AS Total_rows,SUM(customer_id IS NULL) AS Customerid_null,SUM(customer_unique_id IS NULL) AS Customer_uniqueid_null,
SUM(customer_city IS NULL) AS Customer_city_null,
SUM(customer_state IS NULL) AS Customer_state_null FROM olist_customers_dataset;

SELECT COUNT(*) AS Duplicate_rows FROM (SELECT customer_id FROM olist_customers_dataset
GROUP BY customer_id HAVING COUNT(*) > 1) AS duplicates;
 
SELECT COUNT(DISTINCT customer_state) AS Total_state FROM olist_customers_dataset 
ORDER BY customer_state;

-- Data Cleaning,Data type,Duplicate and Null value check and Data validation of Olist Orders Items Table

ALTER TABLE olist_order_items_dataset
MODIFY order_id VARCHAR(100),
MODIFY product_id VARCHAR(100),
MODIFY seller_id VARCHAR(100),
MODIFY price DECIMAL(10,2);

SELECT COUNT(*) AS Total_rows, SUM(order_id IS NULL) AS Orderid_null,
SUM(product_id IS NULL ) AS productid_null , SUM(seller_id IS NULL) AS sellerid_null,
SUM(price IS NULL) AS Price_null FROM olist_order_items_dataset;

SELECT order_id ,COUNT(*) AS Count_check FROM olist_order_items_dataset
GROUP BY order_id HAVING COUNT(*)>1;
 
 SELECT * FROM olist_order_items_dataset WHERE price <0;
 
 -- Data Cleaning,Data type,Duplicate and Null value check and Data validation of Olist Payment Table
 
ALTER TABLE olist_order_payments_dataset
MODIFY order_id VARCHAR(100),
MODIFY payment_type VARCHAR(100),
MODIFY payment_value DECIMAL(10,2);

SELECT COUNT(*) AS Total_rows, SUM(order_id IS NULL) AS Orderid_null, 
SUM(payment_type IS NULL ) AS payment_type ,
SUM(payment_value IS NULL) AS value_null FROM olist_order_payments_dataset;


ALTER TABLE olist_order_reviews_dataset
MODIFY review_score INT,
MODIFY order_id VARCHAR(50);

SELECT COUNT(*) AS Total_rows,  SUM(order_id IS NULL) AS order_id_null,
SUM(review_score IS NULL ) AS review_score_null FROM olist_order_reviews_dataset;
 
 SELECT review_id, COUNT(*) AS Duplicate_count FROM olist_order_reviews_dataset
 GROUP BY order_id HAVING COUNT(*)>1;
 
 -- Data Cleaning,Data type,Duplicate and Null value check and Data validation of Olist Orders Table
 
 ALTER TABLE olist_orders_dataset
 MODIFY order_id VARCHAR(200),
 MODIFY customer_id VARCHAR(200),
 MODIFY order_status VARCHAR(200),
 MODIFY order_purchase_timestamp DATETIME,
 MODIFY order_delivered_customer_date DATETIME,
 MODIFY order_estimated_delivery_date DATETIME;
 
SELECT COUNT(*) AS Total_rows, SUM(order_id IS NULL) AS order_id_null,SUM(customer_id IS NULL) AS customer_id_null,
SUM(order_status IS NULL ) AS order_status_null , SUM(order_purchase_timestamp IS NULL) AS timestamp_null,
SUM(order_delivered_customer_date IS NULL) AS Customer_null, SUM(order_estimated_delivery_date IS NULL) AS Estimated_null FROM olist_order_reviews_dataset;

SELECT order_id , COUNT(*) AS Duplicate_count FROM olist_orders_dataset GROUP BY order_id HAVING COUNT(*)>1;

-- Data Cleaning,Data type,Duplicate and Null value check and Data validation of Olist Products Table

ALTER TABLE olist_products_dataset
MODIFY product_id VARCHAR(50),
MODIFY product_category_name VARCHAR(100);

SELECT COUNT(*) AS Total_rows, SUM(product_id IS NULL) AS Productid_null,
SUM(product_category_name IS NULL) AS Category_null FROM olist_products_dataset;

SELECT product_id , COUNT(*) AS Duplicate_count FROM olist_products_dataset 
GROUP BY product_id HAVING COUNT(*)>1;

-- Data Cleaning,Data type,Duplicate and Null value check and Data validation of Olist Sellers Table

ALTER TABLE olist_sellers_dataset
MODIFY seller_id VARCHAR(50),
MODIFY seller_city VARCHAR(50),
MODIFY seller_state VARCHAR(50);

SELECT COUNT(*) AS Total_rows, SUM(seller_id IS NULL) AS Seller_null,
SUM(seller_city IS NULL) AS seller_city_null, SUM(seller_state IS NULL) AS seller_state_null
FROM olist_sellers_dataset;

SELECT seller_id , COUNT(*) AS Duplicate_count FROM olist_sellers_dataset
GROUP BY seller_id HAVING COUNT(*)>1;

-- Data Cleaning,Data type,Duplicate and Null value check and Data validation of Olist Product category name translation

ALTER TABLE `product_category_name_translation` RENAME COLUMN ï»¿product_category_name TO product_category_name;

ALTER TABLE product_category_name_translation
MODIFY COLUMN product_category_name VARCHAR(100),
MODIFY COLUMN product_category_name_english VARCHAR(100);
 
SELECT COUNT(*) AS Total_rows,SUM(product_category_name IS NULL) AS Product_category_nul,
SUM(product_category_name_english IS NULL) AS Category_name_null 
FROM product_category_name_translation;