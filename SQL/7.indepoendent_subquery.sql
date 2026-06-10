-------------- #### SUB QUERIES

-- ================= TYPE 1: Independent Subquery - Scalar Subquery =======================

-- 1. Find the movie with highest profit()

SELECT * from movies
WHERE (gross - budget) = (SELECT MAX(gross - budget) FROM movies)


SELECT MAX(gross - budget) FROM movies


SELECT * FROM movies
ORDER BY (gross - budget) DESC LIMIT 1

-- 2. Find how many movies have a rating > the avg of all the movie ratings ( Find the count of above average movies)
SELECT * FROM movies
WHERE score >  (SELECT AVG(score) FROM movies)

SELECT COUNT(*) FROM movies
WHERE score >  (SELECT AVG(score) FROM movies)

-- 3. FInd the highest rated movie of 2000
SELECT * FROM movies 
WHERE year = 2000 AND score = (SELECT MAX(score) FROM movies WHERE year = 2000)


-- 4. Find the highest rated moview among all moviews whose number of votes > the dataset avg votes

SELECT * FROM movies
WHERE score = (SELECT MAX(score) FROM movies
			   WHERE votes > (SELECT AVG(votes) FROM movies))


-- ================= TYPE 2: Independent Subquery - Row Subquery(One Col Multi Rows) =======================

-- 1. Find all users who never ordered
SELECT * FROM users 
WHERE user_id NOT IN (SELECT DISTINCT(user_id) from orders)

-- 2. find all the movies made by top 3 director ( in terms of total gross income)

SELECT * FROM movies
WHERE director IN (SELECT director FROM movies
				GROUP BY director 
				ORDER BY SUM(gross) DESC LIMIT 3)



-- 3. Find all movies of all those actors whose filmography's avg rating > 8.5 (take 25000 votes as cutoff )

SELECT * FROM movies
WHERE star IN (SELECT star as avg_score FROM movies 
				WHERE votes > 25000
				GROUP BY star
				HAVING AVG(score) > 8.5) 


-- ================= TYPE 3: Independent Subquery - Table Subquery(Multi Col Multi Rows) =======================


-- 1. find the most profitable movie of each year
SELECT * FROM movies
WHERE (year, gross-budget) IN (SELECT year, MAX(gross - budget) as profit FROM movies
								GROUP BY year
								ORDER BY year ASC)




-- 2. find the highest rated movie of each genre votes cutoff of 25000

SELECT * FROM movies
WHERE (genre, score) IN (SELECT genre, MAX(score) FROM movies
							WHERE votes > 25000
							GROUP BY genre)
AND votes > 25000

-- 3. find the highest grossing movies of top 5 actor/director combo in terms of total gross income.

SELECT star, director, SUM(gross) as sum_gross, MAX(gross)
FROM movies
WHERE gross IS NOT NULL
GROUP BY star, director
ORDER BY SUM(gross) DESC LIMIT 50


WITH top_duos AS(
	SELECT star, director, MAX(gross)
	FROM movies
	WHERE gross IS NOT NULL
	GROUP BY star, director
	ORDER BY SUM(gross) DESC LIMIT 5
)


SELECT * FROM movies
WHERE (star, director, gross) IN (SELECT * FROM top_duos)

