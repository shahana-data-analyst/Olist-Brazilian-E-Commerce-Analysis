# 🛒 Brazilian E-Commerce Performance Analysis (SQL + Power BI)

An end-to-end data analytics project using the **Olist Brazilian E-Commerce Dataset** to analyze business performance across sales, customer behavior, and logistics operations. 

---

## 📌 Project Overview / Executive Summary
This project analyzes the performance of a Brazilian e-commerce platform (Olist) using a dataset containing **99K+ real orders** from 2016 to 2018. The core objective is to transform raw marketplace data into actionable business intelligence. By building a robust **SQL data aggregation pipeline** and an interactive **3-Page Power BI Dashboard**, this project uncovers hidden bottlenecks in delivery operations, patterns in customer preferences, and key revenue drivers to optimize overall marketplace health.

---

## 🎯 Business Problems
This project explicitly addresses three critical pillars of e-commerce operations:
* **Sales Operations:** Identifying where revenue is concentrated, which product categories dominate market share, and how sales fluctuate month-over-month.
* **Customer Experience:** Evaluating customer satisfaction through review distributions and understanding behavior via preferred payment modes.
* **Logistics Bottlenecks:** Pinpointing specific states experiencing severe delivery delays and analyzing how late deliveries directly hurt customer review scores.

---

## 🗄️ Tech Stack & Data Pipeline
* **Database:** SQL (Data Ingestion, Extraction, Joins, and Complex Aggregations)
* **BI Tool:** Power BI Desktop (Star-Schema Data Modeling, Power Query, & Visualization)
* **Languages:** SQL Queries, DAX Formulas

---

## 💻 Data Engineering & SQL Snippets
To demonstrate data engineering and analytical capabilities, below are two critical queries written for this project:

### 1. Logistics Efficiency (Late Delivery Percentage)
This query calculates the exact percentage of orders that missed their estimated delivery window, helping stakeholders quantify operational bottlenecks.
```sql
SELECT 
    ROUND(SUM(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Late_delivery_percentage 
FROM olist_orders_dataset
WHERE order_status = 'delivered';
```

### 2. Month-over-Month Revenue Growth Trend
This query aggregates total revenue chronologically by month to track sales trajectories and seasonal peaks.
```sql
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS Monthly_sales,
    SUM(oi.price) AS Total_Revenue 
FROM olist_orders_dataset o 
JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id 
GROUP BY Monthly_sales 
ORDER BY Monthly_sales;
```

---

## 📁 Project Structure
The repository is structured logically to ensure clean separation between the data engineering scripts, Power BI reports, and visual assets:

```text
├── Dataset/Original Dataset/   # Contains raw data links or documentation
├── SQL/                       # Production-ready SQL scripts for cleaning and analysis
│   ├── .gitkeep
│   ├── Data Analysis.sql
│   ├── Data Cleaning.sql
│   └── olist_brazilian__dataset.sql
├── power BI/                  # Compiled Power BI Desktop report files
│   ├── .gitkeep
│   └── Olist_brazilian_ecommerce.pbix
├── screenshots/               # Dashboard preview images for documentation
│   ├── .gitkeep
│   ├── Customer & Behaviour Analysis.png
│   ├── Delivery & Operation Analysis.png
│   └── Sales Analysis.png
└── README.md                  # Project documentation and insights
```

---

## 📸 Dashboard Screenshots & Insights

### Page 1: Sales Analysis Dashboard
<img src="screenshots/Sales Analysis.png" alt="Sales Analysis" width="100%"/>

* **Key Insight:** The platform generated **R\$13.59M in Total Revenue** from **99K orders**. Sales show heavy geographic concentration, with **São Paulo (SP) alone contributing R\$5.20M**, making it the single largest market driver. Additionally, top-tier categories like *Beleza Saude* (R\$1.26M) and *Relogios Presentes* (R\$1.21M) dominate the overall wallet share.

---

### Page 2: Customer & Behaviour Analysis Dashboard
<img src="screenshots/Customer & Behaviour Analysis.png" alt="Customer Behaviour" width="100%"/>

* **Key Insight:** **Credit Cards are the dominant payment method**, accounting for an overwhelming **76.8K orders**, while cash-based *Boleto* trails second at 19.78K. Despite diverse buying segments, customer satisfaction remains healthy, with 5-star reviews representing the majority (**57.33K out of total reviews**) bringing the platform's **Average Review Score to 4.09**.

---

### Page 3: Delivery & Operation Analysis Dashboard
<img src="screenshots/Delivery & Operation Analysis.png" alt="Delivery & Operations" width="100%"/>

* **Key Insight:** While the platform maintains a **93.23% On-Time Delivery rate**, severe logistics bottlenecks exist in northern states, where **Alagoas (AL) suffers a massive 21.41% Late Delivery rate**, closely followed by Maranhão (MA) at 17.43%. There is a direct correlation between delivery performance and brand reputation: **On-time orders enjoy an average review score of 4.3, whereas late deliveries plunge customer satisfaction down to a low 2.3 score**.

---

## 💡 Actionable Business Recommendations
Based on the comprehensive data analysis above, the following strategic actions are recommended to executive management:

1. **Logistics Optimization in High-Risk States:** Partner with localized regional third-party logistics (3PL) carriers in **Alagoas (AL)** and **Maranhão (MA)** to overhaul fulfillment lines and bring down the ~21% late delivery rates closer to the national average.
2. **Targeted Regional Campaigns:** Since **São Paulo (SP) and Rio de Janeiro (RJ)** generate the lion's share of revenue, launch region-specific promotional campaigns focusing on top-performing product categories like *Beleza Saude* and *Cama Mesa Banho* to maximize ROI.
3. **Financial Incentives for Alternative Payments:** Introduce exclusive, targeted cashback offers or zero-interest EMI schemes for credit card users to further leverage the 76% preference rate, while optimizing processing steps for *Boleto* transactions to reduce checkout-to-shipment friction.

---

## 🚀 How to Run the Project
Follow these simple steps to replicate the environment and view the project locally:

1. **Set Up Database:** Execute the scripts inside the `SQL/` folder in your SQL database workbench to create the database schemas, clean the dataset, and run aggregations.
2. **Open Dashboard:** Download and open the interactive Power BI file (`Olist_brazilian_ecommerce.pbix`) from the `power BI/` folder. Update the data source credentials to link to your local database instance and click **Refresh** to populate the visual reports.
