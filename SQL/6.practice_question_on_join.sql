-- ------------------------- Joining more than 2 tables

-------------- 1. find order name and corresponding caregory name 

SELECT * FROM orders


SELECT * FROM users


SELECT * FROM order_details t1
JOIN orders t2
ON t1.order_id = t2.order_id
JOIN users t3
ON t2.user_id = t3.user_id


-- ### FILTERING FROM THE JOINED TABLE

SELECT t1.order_id, t1.amount, t1.profit, t3.name, t3.user_id 
FROM order_details t1
JOIN orders t2
ON t1.order_id = t2.order_id
JOIN users t3
ON t2.user_id = t3.user_id

--- FIND order_id, name and city by joining users and orders

SELECT t1.order_id, t2.name, t2.city 
FROM orders t1
JOIN users t2
ON t1.user_id = t2.user_id


--- FIND order_id, product category by joining order_details and category
SELECT * from category


SELECT t1.order_id, t2.vertical 
FROM order_details t1
JOIN category t2
ON t1.category_id = t2.category_id



-- FILTERING ROWS ON JOIN

-- FIND ALL ORDERS PLACED IN PUNE by Sarita

SELECT * FROM orders t1
JOIN users t2
ON t1.user_id = t2.user_id
WHERE t2.city = 'Pune' AND t2.name = 'Sarita'


-- QUESTIONS

-- 1. find all profitable orders

SELECT t1.order_id, SUM(t2.profit) AS ORDER_PROFIT FROM orders t1
JOIN order_details t2
ON t1.order_id = t2.order_id
GROUP BY t1.order_id
HAVING SUM(t2.profit) > 0


-- 2. find the customer who has placed max number of orders

SELECT t1.name, COUNT(*) AS num_orders FROM users t1
JOIN orders t2
ON t1.user_id = t2.user_id
GROUP BY t1.name 
ORDER BY COUNT(*) DESC LIMIT 1

-- 3. which is the most profitable category

SELECT t2.vertical, SUM(t1.profit) AS category_profit FROM order_details t1
JOIN category t2
ON t1.category_id = t2.category_id
GROUP BY t2.vertical
ORDER BY SUM(t1.profit) DESC LIMIT 1


-- 4. which is the most profitable state

SELECT t1.state, SUM(t3.profit) as total_state_profit FROM users t1
JOIN orders t2
ON t1.user_id = t2.user_id
JOIN order_details t3
ON t2.order_id = t3.order_id
GROUP BY t1.state
ORDER BY SUM(t3.profit) DESC LIMIT 1

-- 5. Find all categories with profit higher than 3000

SELECT t2.vertical, SUM(t1.profit) AS "total_category_profit" FROM order_details t1
JOIN category t2
ON t1.category_id = t2.category_id
GROUP BY t2.vertical 
HAVING SUM(t1.profit) > 3000

















