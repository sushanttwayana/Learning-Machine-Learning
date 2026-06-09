-- ### HAVING CLAUSE

-- 1.  Find the avg rating of smartphone brands whcih have more than 20 phones
SELECT brand_name, AVG(rating) as avg_rating, COUNT(*) as count_of_phones
FROM smartphone_dataset
GROUP BY brand_name
HAVING COUNT(*) > 20
ORDER BY avg_rating DESC
 
-- 2. find the top 3 brands with the highest 
-- avg ram that have a refresh rate of at least 90 hz and fast charging available and dont
-- consider brands which have less than 10 phones
SELECT brand_name, AVG(ram_capacity) as avg_ram_capacity, COUNT(*) as no_of_phone
FROM smartphone_dataset 
WHERE refresh_rate > 90 AND fast_charging_available = 1
GROUP BY brand_name HAVING COUNT(*) > 10
ORDER BY avg_ram_capacity DESC LIMIT 3

-- 3. find the avg price of all the phone brands with avg rating > 70 and num_phones more than 10 among all 5g enabled phone
SELECT brand_name, AVG(price) as avg_price, AVG(rating) as avg_rating 
FROM smartphone_dataset
WHERE has_5g = True
GROUP BY brand_name
HAVING COUNT(*)> 10 AND AVG(rating) > 70