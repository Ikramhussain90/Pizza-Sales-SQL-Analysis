# 🍕 Pizza Sales Analysis — MySQL

![SQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

## 📌 Project Overview
A complete SQL-based analysis of a Pizza restaurant's sales data. This project covers basic to advanced SQL concepts including JOINs, Aggregations, Subqueries, and Window Functions.

---

## 🗂️ Database Schema

```
orders          → order_id, order_date, order_time
order_details   → order_details_id, order_id, pizza_id, quantity
pizzas          → pizza_id, pizza_type_id, size, price
pizza_types     → pizza_type_id, name, category, ingredients
```

---

## 📊 Analysis Questions

### 🔹 Basic
| # | Question |
|---|----------|
| Q1 | Total number of orders placed |
| Q2 | Total revenue generated from pizza sales |
| Q3 | Highest priced pizza |
| Q4 | Most common pizza size ordered |
| Q5 | Top 5 most ordered pizza types with quantities |

### 🔸 Intermediate
| # | Question |
|---|----------|
| Q6 | Total quantity of each pizza category ordered |
| Q7 | Distribution of orders by hour of the day |
| Q8 | Category-wise distribution of pizzas |
| Q9 | Average number of pizzas ordered per day |
| Q10 | Top 3 most ordered pizza types based on revenue |

### 🔺 Advanced
| # | Question |
|---|----------|
| Q11 | Percentage contribution of each pizza type to total revenue |
| Q12 | Top 3 most ordered pizza types based on revenue for each category |

---

## 💡 Key Insights
- 🏆 **Most Ordered Size**: Large pizzas dominate orders
- 📅 **Peak Hours**: Lunch and dinner time see highest orders
- 💰 **Top Revenue Pizza**: Classic Deluxe Pizza
- 🍕 **Top Category**: Classic category contributes highest revenue

---

## 🛠️ SQL Concepts Used
- `JOIN` (INNER JOIN — multiple tables)
- `GROUP BY` & `ORDER BY`
- `Aggregate Functions` (SUM, COUNT, ROUND, AVG)
- `Subqueries`
- `Window Functions` (RANK, PARTITION BY)
- `LIMIT`
- `HOUR()` date-time functions

---

## 📁 Files
| File | Description |
|------|-------------|
| `Pizza_Sales_Analysis.sql` | All 12 analysis queries |
| `README.md` | Project documentation |

---

## 🛠️ Tools Used
- MySQL Workbench 8.0
- SQL (DDL, DML, Window Functions)

---

## 👤 Author
**[Ikram Hussain]**  
[LinkedIn Profile] | [GitHub Profile]
