DROP TABLE IF EXISTS smartphone_dataset;

CREATE TABLE smartphone_dataset (
    brand_name TEXT,
    model TEXT,
    price NUMERIC,
    rating NUMERIC,
    has_5g BOOLEAN,
    has_nfc BOOLEAN,
    has_ir_blaster BOOLEAN,
    processor_brand TEXT,
    num_cores NUMERIC,
    processor_speed NUMERIC,
    battery_capacity NUMERIC,
    fast_charging_available INTEGER,
    fast_charging NUMERIC,
    ram_capacity NUMERIC,
    internal_memory NUMERIC,
    screen_size NUMERIC,
    refresh_rate INTEGER,
    num_rear_cameras INTEGER,
    num_front_cameras NUMERIC,
    os TEXT,
    primary_camera_rear NUMERIC,
    primary_camera_front NUMERIC,
    extended_memory_available INTEGER,
    extended_upto NUMERIC,
    resolution_width INTEGER,
    resolution_height INTEGER
);


SELECT * FROM smartphone_dataset


---- SELECT COMMAND ----

-- Filer Columns
SELECT os, model, price, rating FROM smartphone_dataset


-- Rename column name
SELECT os AS "OPERATING SYSTEM", model, battery_capacity AS "battery_capacity(mAH)" FROM smartphone_dataset

--- Calucalte mathematical expression
SELECT model, 
SQRT(resolution_width * resolution_width + resolution_height * resolution_height)/ screen_size AS "PPI"  
FROM smartphone_dataset

--- Constants column

SELECT model, 'smartphone' AS "Type" FROM smartphone_dataset

--- Select unique values
SELECT DISTINCT(brand_name) AS "All_Brands" from smartphone_dataset

--- DISTINCT COMBO
SELECT DISTINCT brand_name, processor_brand FROM smartphone_dataset 

------ Filter rows using WHERE CLAUSE
SELECT * FROM smartphone_dataset  WHERE brand_name = 'samsung'

SELECT * FROM smartphone_dataset WHERE price > 50000

SELECT * FROM smartphone_dataset WHERE price BETWEEN 50000 AND 100000

SELECT * FROM smartphone_dataset WHERE price < 25000 AND rating > 80

SELECT * FROM smartphone_dataset WHERE brand_name = 'samsung' AND ram_capacity > 8

--- Find brands who sell phones with price > 50000

SELECT brand_name from smartphone_dataset WH
 


--- IN AND NOT IN
SELECT * FROM smartphone_dataset WHERE processor_brand IN ('snapdragon', 'exynos')

----- UPDATE
UPDATE smartphone_dataset
SET processor_brand = 'dimensity'
WHERE processor_brand ='mediatek'

----- DELETE 
-- DELETE FROM smartphone_dataset WHERE price > 200000

---- AGGEGATE FUNCTION
SELECT MAX(price) FROM smartphone_dataset WHERE brand_name='samsung'
SELECT AVG(price) FROM smartphone_dataset WHERE brand_name='samsung'
SELECT COUNT(*) FROM smartphone_dataset WHERE brand_name='samsung'
SELECT COUNT(DISTINCT(brand_name)) FROM smartphone_dataset
SELECT VARIANCE(price) FROM smartphone_dataset WHERE brand_name='samsung'

------- SORTING DATA -----------------------
SELECT * FROM smartphone_dataset

-- 1. Find top 5 samsung phones with biggest screen size
SELECT * FROM smartphone_dataset WHERE brand_name='samsung' ORDER BY screen_size DESC LIMIT 5

-- 2. Sort all the phone in descending order of number of total cameras
SELECT (num_rear_cameras + num_front_cameras) AS "total_cameras" FROM smartphone_dataset ORDER BY "total_cameras" DESC 

-- 3. sort data on the basis of ppi in decreasing order
SELECT DISTINCT model, brand_name, price, 
SQRT(resolution_width * resolution_width + resolution_height * resolution_height)/ screen_size AS PPI 
FROM smartphone_dataset 
ORDER BY PPI DESC 

-- 4. find the phone with 2nd largest battery
SELECT * FROM smartphone_dataset WHERE battery_capacity IS NOT NULL ORDER BY battery_capacity DESC LIMIT 1 OFFSET 1
SELECT battery_capacity FROM smartphone_dataset WHERE battery_capacity IS NOT NULL ORDER BY battery_capacity DESC LIMIT 1 OFFSET 1

-- 5. find the name and rating of the worst rated apple phone
SELECT brand_name, rating FROM smartphone_dataset WHERE brand_name='apple' ORDER BY rating ASC 

-- 6. Sort phones alphabetically and then on the basis of rating in desc order
SELECT * FROM smartphone_dataset ORDER BY brand_name ASC , rating DESC 

