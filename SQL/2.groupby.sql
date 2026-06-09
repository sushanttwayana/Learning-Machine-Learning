---------- GROUPING DATA

-- 1. Group smartphones by brand_name and get the count, avg price, max rating , avg screen size and avg battery capacity

SELECT * FROM smartphone_dataset 

SELECT brand_name, COUNT(*) AS num_phones,
AVG(price) AS avg_price,
MAX(rating) as max_rating,
ROUND(AVG(screen_size), 2) as avg_screen_size,
ROUND(AVG(battery_capacity), 3) as avg_battery_capacity
FROM smartphone_dataset
GROUP BY brand_name 
ORDER BY num_phones DESC 

-- 2.  GROUP smartphones by whether they have an NFC ang get the avg price and rating 

SELECT has_nfc, AVG(price) as price, AVG(rating) as rating
FROM smartphone_dataset
GROUP BY has_nfc


SELECT extended_memory_available, AVG(price) as avg_price, AVG(rating) as avg_rating
FROM smartphone_dataset
GROUP BY extended_memory_available

-- 3 GRoup smartphones by the brand and processor brand and get the count of models and the average primary camera resolution(rear)

SELECT brand_name, processor_brand, COUNT(model) as num_phones,
AVG(primary_camera_rear) as avg_camera_resolution
FROM smartphone_dataset
GROUP BY brand_name, processor_brand 
ORDER BY brand_name ASC


-- 4. Find top 5 most costly individual phone

SELECT brand_name, model, price 
FROM smartphone_dataset
ORDER BY price DESC LIMIT 5


 -- 5. Find top 5 most costly phone brands
SELECT brand_name, ROUND(AVG(price)) as avg_price 
FROM smartphone_dataset
GROUP BY brand_name
ORDER BY avg_price DESC LIMIT 5

-- 6. Wich brand makes the smallest screen smartphones
SELECT brand_name, ROUND(AVG(screen_size), 3) AS avg_screen_size
FROM smartphone_dataset
GROUP BY brand_name
ORDER BY avg_screen_size ASC LIMIT 1

-- 7. Avg price of 5g phones vs avg price of non 5g phones
SELECT has_5g, AVG(price) as price
FROM smartphone_dataset
GROUP BY has_5g

-- 8. Group smartphones by the brand, and find the brand with the highest number of models that have both NFC and an IR blaster

SELECT brand_name, COUNT(*) AS no_of_models
FROM smartphone_dataset
WHERE has_nfc = TRUE AND has_ir_blaster = TRUE
GROUP BY brand_name
ORDER BY no_of_models DESC LIMIT 1


-- 9. Find all samsung 5g enabled smartphones and find out the avg price for NFC and NON-NFC phones
SELECT has_nfc, ROUND(AVG(price), 3) as avg_price
FROM smartphone_dataset 
WHERE brand_name = 'samsung' AND has_5g = TRUE
GROUP BY has_nfc


-- 10. Find the phone name, price of the costliest phone
SELECT model, price FROM smartphone_dataset 
ORDER BY price DESC LIMIT 1