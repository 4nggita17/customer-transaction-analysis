# Customer Transaction Behavior Analysis

## 📌 Project Overview

This project analyzes customer transaction behavior using PostgreSQL and Python.  

The objective is to explore revenue patterns, customer behavior, payment preferences, and churn indicators while performing structured data validation and quality assessment.

---

## 🗄 Dataset Description

The dataset contains transactional-level customer purchase data including:

- Customer information
- Purchase date
- Product category
- Quantity
- Product price
- Transaction amount
- Payment method
- Return indicator
- Churn status

---

## ⚠ Data Quality Assessment

During data validation, several structural limitations were identified:

1. The dataset does not include a unique `transaction_id`
   - A surrogate primary key was created.

2. No `product_id` is provided
   - Product-level analysis was conducted at the `product_category` level.

3. Significant inconsistencies were found between:
   



These deviations exceed rounding errors, suggesting:
- Synthetic data generation
- Hidden discount/tax logic not provided in the dataset

For analytical consistency, the `total_purchase_amount` column was treated as the source of truth for revenue calculations.

---

## 🛠 Tech Stack

- PostgreSQL
- SQL
- Python
- Pandas
- Matplotlib
- Seaborn
- SQLAlchemy

---

## 📊 Analysis Performed

### 1️⃣ Data Structuring
- Created surrogate primary key
- Validated null values
- Checked revenue inconsistencies

### 2️⃣ Revenue Analysis
- Total revenue
- Revenue by product category
- Monthly revenue trend

### 3️⃣ Customer Behavior Analysis
- Average customer spending
- Payment method distribution
- Return rate impact

### 4️⃣ Churn Analysis
- Spending comparison between churned and active customers
- Transaction frequency behavior

---

## 📈 Key Insights

- Revenue concentration observed in top product categories
- Credit card is the dominant payment method
- Churned customers show lower average spending
- Revenue fluctuates seasonally on a monthly basis
- Dataset shows structural inconsistencies typical of synthetic datasets

---

## 📌 Conclusion

This project demonstrates:

- Data validation and integrity assessment
- Structured SQL analysis
- Analytical thinking beyond surface-level aggregation
- End-to-end workflow from raw data to insight visualization
