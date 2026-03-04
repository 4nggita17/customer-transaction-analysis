-- ==========================================
-- DATA CLEANING & VALIDATION
-- ==========================================

-- check total data transaksi
SELECT COUNT(*) FROM transactions;



-- check data anomali 
SELECT
COUNT(*) FILTER (WHERE customer_id IS NULL) AS null_customer,
COUNT(*) FILTER (WHERE purchase_date IS NULL) AS null_date,
COUNT(*) filter (where quantity is null) as null_qty,
count(* filter (where product_price is null) as null_price,
COUNT(*) FILTER (WHERE total_purchase_amount IS NULL) AS null_amount,
COUNT(*) FILTER (WHERE churn IS NULL) AS null_churn
FROM transactions;


-- cek nilai negatif / tidak valid
select  * 
from transactions 
where quantity <= 0 or product_price <= 0 or total_purchase_amount < 0;


-- cek inkonsistensi amount vs qty * price
select 
transaction_id,
quantity ,
product_price ,
total_purchase_amount ,
(quantity*product_price) as expected_amount,
(total_purchase_amount - (quantity * product_price)) as diff
from transactions;

-- cek seberapa besar mismatch
select 
count(*) as total_rows,
count(*) filter(where abs(total_purchase_amount - (quantity * product_price)) > 1) as major_mismatch,
round(count(*) filter(where abs(total_purchase_amount - (quantity * product_price)) > 1)* 100.0 / count(*),
2) as mismatch_percent
from transactions; 

-- cek pola berdasarkan kategori
SELECT
product_category,
AVG(total_purchase_amount - (quantity * product_price)) AS avg_diff
FROM transactions
GROUP BY product_category
ORDER BY ABS(AVG(total_purchase_amount - (quantity * product_price))) DESC;
