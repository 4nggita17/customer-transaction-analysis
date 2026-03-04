CREATE TABLE transactions (
    customer_id TEXT,
    purchase_date DATE,
    product_category TEXT,
    product_price NUMERIC,
    quantity INT,
    amount NUMERIC,
    payment_method TEXT,
    customer_age INT,
    returns INT,
    customer_name TEXT,
    gender TEXT,
    churn INT
);

COPY transactions
FROM 'path/ecommerce_customer_data_custom_ratios.csv'
DELIMITER ','
CSV HEADER;