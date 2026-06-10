-------------- #### SUB QUERIES

-- ================= TYPE 2: Correlated Subquery=======================

-- 1. Find all the movies that have a rating higher than the average rating of movies in the same genre

SELECT * FROM movies m1
WHERE score > (SELECT AVG(score) FROM movies m2 WHERE m2.genre = m1.genre)


-- 2. FInd the favorite food of each customer

SELECT * FROM users
WHERE user_id NOT IN (SELECT DISTINCT (user_id) FROM orders);


WITH fav_food AS (
	SELECT t2.user_id, name, f_name, COUNT(*) as frequency FROM users t1
	JOIN orders t2 ON t1.user_id  = t2.user_id
	JOIN order_details t3 ON t2.order_id = t3.
	JOIN fodd t4 ON t3.f_id = t4.f_id
	GROUP BY t2.user_id, t3.f_id
)

SELECT * FROM fav_food
WHERE frequncy = (SELECT MAX(frequency) FROM fav_food f2
					WHERE f2.user_id = f1.user_id )


--  =============== Using Subquerires in SELECT

-- 1. Get the percentage of votes for each movie compared to the total number of votes

SELECT name, (votes/(SELECT SUM(votes) FROM movies)) * 100 FROM movies

-- 2. Display all moview names, genre , score and avg(score) of genre

SELECT name, genre, score, (SELECT AVG(score) FROM movies m2 WHERE m2.genre = m1.genre)
FROM movies m1


--  =============== Using Subquerires in FROM

-- Display average rating of all the resturant

 SELECT r_name, avg_raing
 FROM (SELECT r_id, AVG(resturant_rating) AS 'avg_rating'
 		FROM orders 
		 GROUP BY r_id) t1 JOIN resturants t2
		 ON t1.r_id = t2.r_id
		 )

--- find genres having avg score > avg score of all the movies

SELECT genre, AVG(score) 
FROM movies
GROUP BY genre
HAVING AVG(score) > (SELECT AVG(score) FROM movies)

--- SUbquery in INSERT

-- Populate a already created loyal_customer table with records of only those customers who have ordered food more than 3 times

INSERT INTO loyal_users (user_id, name)
SELECT t1.user_id,name, COUNT(*)
FROM orders t1
JOIN users t2 ON t1.user_id = t2.user_id
GROUP BY user_id
HAVING COUNT(*) > 3


-- Populate the money col of loyal customer table using the orders table. Provide a 10% app money to all customers based on their order value

UPDATE loyal_users lu
SET money = 
(
    SELECT SUM(amount)*0.1
    FROM orders o
    WHERE o.user_id = lu.user_id
);


--- DELETE all customers who have never ordered

DELETE FROM users 
WHERE user_id IN (SELECT user_id FROM users
WHERE user_id NOT IN (SELECT DISTINCT(user_id) FROM orders))
