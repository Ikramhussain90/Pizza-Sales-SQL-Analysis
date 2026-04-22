-- ============================================
-- 🍕 PIZZA SALES ANALYSIS — MySQL
-- Author: [Your Name]
-- Date: 2023
-- Description: Complete SQL analysis of pizza
--              sales data using joins, aggregations,
--              window functions and subqueries
-- ============================================

-- ============================================
-- BASIC QUERIES
-- ============================================

-- Q1. Total Number of Orders Placed
SELECT COUNT(order_id) AS total_orders 
FROM orders;

-- ============================================

-- Q2. Total Revenue Generated from Pizza Sales
SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price), 2) AS total_sales
FROM order_details 
JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id;

-- ============================================

-- Q3. Highest Priced Pizza
SELECT pizza_types.name, pizzas.price
FROM pizza_types 
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC 
LIMIT 1;

-- ============================================

-- Q4. Most Common Pizza Size Ordered
SELECT pizzas.size, COUNT(order_details.order_details_id) AS order_count
FROM pizzas 
JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size 
ORDER BY order_count DESC 
LIMIT 1;

-- ============================================

-- Q5. Top 5 Most Ordered Pizza Types with Quantities
SELECT pizza_types.name,
       SUM(order_details.quantity) AS quantity 
FROM pizza_types 
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name 
ORDER BY quantity DESC 
LIMIT 5;

-- ============================================
-- INTERMEDIATE QUERIES
-- ============================================

-- Q6. Total Quantity of Each Pizza Category Ordered
SELECT pizza_types.category,
       SUM(order_details.quantity) AS quantity
FROM pizza_types 
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category 
ORDER BY quantity DESC;

-- ============================================

-- Q7. Distribution of Orders by Hour of the Day
SELECT HOUR(order_time) AS hour, 
       COUNT(order_id) AS order_count
FROM orders 
GROUP BY HOUR(order_time)
ORDER BY hour;

-- ============================================

-- Q8. Category-wise Distribution of Pizzas
SELECT category, COUNT(name) AS total_pizzas
FROM pizza_types
GROUP BY category;

-- ============================================

-- Q9. Average Number of Pizzas Ordered Per Day
SELECT ROUND(AVG(quantity), 0) AS avg_pizzas_per_day
FROM (
    SELECT orders.order_date, 
           SUM(order_details.quantity) AS quantity
    FROM orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date
) AS order_quantity;

-- ============================================

-- Q10. Top 3 Most Ordered Pizza Types Based on Revenue
SELECT pizza_types.name, 
       SUM(order_details.quantity * pizzas.price) AS revenue 
FROM pizza_types
JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name 
ORDER BY revenue DESC 
LIMIT 3;

-- ============================================
-- ADVANCED QUERIES
-- ============================================

-- Q11. Percentage Contribution of Each Pizza Type to Total Revenue
SELECT pizza_types.category,
       ROUND(
           SUM(order_details.quantity * pizzas.price) / 
           (SELECT ROUND(SUM(order_details.quantity * pizzas.price), 2)
            FROM order_details 
            JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id
           ) * 100, 2
       ) AS revenue_percentage
FROM pizza_types 
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category 
ORDER BY revenue_percentage DESC;

-- ============================================

-- Q12. Top 3 Most Ordered Pizza Types Based on Revenue for Each Category
SELECT name, revenue 
FROM (
    SELECT category, name, revenue,
           RANK() OVER(PARTITION BY category ORDER BY revenue DESC) AS rn
    FROM (
        SELECT pizza_types.category, 
               pizza_types.name,
               SUM(order_details.quantity * pizzas.price) AS revenue
        FROM pizza_types 
        JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
        GROUP BY pizza_types.category, pizza_types.name
    ) AS a
) AS b
WHERE rn <= 3;

-- ============================================
-- END OF ANALYSIS
-- ============================================
