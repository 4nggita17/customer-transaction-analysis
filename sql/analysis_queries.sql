-- total revenue
SELECT SUM(total_purchase_amount) AS total_revenue
FROM transactions;


-- revenue by category
SELECT
product_category,
SUM(total_purchase_amount) AS total_revenue
FROM transactions
GROUP BY product_category
ORDER BY total_revenue DESC;


-- revenue trend
SELECT
DATE_TRUNC('month', purchase_date) AS month,
SUM(total_purchase_amount) AS monthly_revenue
FROM transactions
GROUP BY month
ORDER BY month;


-- churn analysis
SELECT
churn,
AVG(total_purchase_amount) AS avg_spending,
COUNT(*) AS total_transactions
FROM transactions
GROUP BY churn;