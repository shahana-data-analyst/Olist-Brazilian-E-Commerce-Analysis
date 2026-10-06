-- Business Quesion:

-- 1)What is the Total Orders?
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM olist_order_dataset;

-- 2)What is the Total Revenue generated from all orders?
SELECT ROUND(SUM(price),2) AS Total_Revenue FROM olist_order_items;

-- 3)How are customer review distribution across different rating across?
SELECT review_score,COUNT(*) AS Review_count FROM olist_order_review_dataset
GROUP BY review_score ORDER BY review_score;

-- 4)Which payment type mostly used most frequently by customers?
SELECT payment_type,COUNT(*) AS Payment_count FROM olist_payments_dataset 
GROUP BY payment_type ORDER BY 
payment_count DESC;

-- 5)Which product categories generate thw highest revenue?
SELECT p.product_category_name AS Category, SUM(o.price) AS Total_Revenue FROM oilst_order_items o
JOIN olist_product_dataset p ON o.product_id = p.product_id 
GROUP BY p.product_category_name ORDER BY Total_Revenue DESC;

-- 6)Which Brazilian states generate the highest revenue?
SELECT c.customer_state,SUM(oi.price) AS Total_revenue FROM olist_order_datset o JOIN olist_customer_datset c
ON o.customer_id=c.customer_id JOIN olist_item_datset oi ON o.product_id = oi.product_id
GROUP BY c.customer_state ORDER Total_revenue DESC;

-- 7)Which percantage of orders were delivered later than the estimated  delivery date?
SELECT ROUND(SUM(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date
THEN 1 
ELSE 0
END
) * 100.0 / COUNT(*),2)
AS Late_delivery_percentage FROM olist_orders_dataset
WHERE order_status = 'delivered';

-- 8)What is the average number of days taken to deliver an orders?
SELECT ROUND(AVG(DATEDIFF(order_delivered_customer_date,order_purchase_timestamp)),2) AS 
Average_dayas FROM olist_orders_dataset WHERE order_status ='delivered';

-- 9)Who are the Top 10 sellers based on revenue generated?
SELECT seller_id,SUM(price) AS Total_Revenue FROM olist_order_items_dataset
GROUP BY seller_id ORDER BY Total_Revenue DESC LIMT 10;

-- 10)How does revenue change month by month?
SELECT DATE_FORMAT(o.order_purchase_timestamp,'%Y%M') AS Monthly_sales,
SUM(oi.price) AS Total_Revenue FROM olist_orders_dataset o JOIN olist_order_items_dataset oi
ON o.order_id = oi.product_id GROUP BY Monthly_sales ORDER BY Monthly_sales;