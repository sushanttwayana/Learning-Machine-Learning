DROP TABLE users

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    emergency_contact VARCHAR(20)
);

CREATE TABLE groups (
    group_id INT PRIMARY KEY,
    group_name VARCHAR(100)
);

CREATE TABLE membership (
    membership_id INT PRIMARY KEY,
    group_id INT,
    user_id INT
);

INSERT INTO users (user_id, name, age, emergency_contact)
VALUES
(1, 'Alice', 25, '9876543210'),
(2, 'Bob', 30, '9876543211'),
(3, 'Charlie', 28, '9876543212'),
(4, 'David', 35, '9876543213'),
(5, 'Eva', 22, '9876543214');


INSERT INTO groups (group_id, group_name)
VALUES
(101, 'Developers'),
(102, 'Designers'),
(103, 'Managers'),
(104, 'HR');


INSERT INTO membership (membership_id, group_id, user_id)
VALUES
(1, 101, 1),   -- Alice -> Developers
(2, 101, 2),   -- Bob -> Developers
(3, 102, 3),   -- Charlie -> Designers
(4, 103, 4),   -- David -> Managers

-- Orphan records for testing joins
(5, 999, 1),   -- Group doesn't exist
(6, 101, 999); -- User doesn't exist



-- ------ JOINS IN SQL

SELECT * FROM groups

-- CARTESIAN JOIN / CROSS JOIN

SELECT * FROM users t1
CROSS JOIN groups t2


---- INNER JOIN

SELECT * FROM membership t1
INNER JOIN users t2
ON t1.user_id = t2.user_id


-- LEFT JOIN
SELECT * FROM membership t1
LEFT JOIN users t2
ON t1.user_id = t2.user_id

-- RIGHT JOIN
SELECT * FROM membership t1
RIGHT JOIN users t2
ON t1.user_id = t2.user_id


-- FULL OUTER JOIN
SELECT * FROM membership t1
FULL OUTER JOIN users t2
ON t1.user_id = t2.user_id


-- ### UNION

SELECT * FROM person1
UNION
SELECT * FROM person2 


-- ### SELF JOIN
SELECT * FROM users t1
JOIN users t2
ON t1.emergency_contact = t2.user_id



-- #### JOINING ON MORE THAN ONE COLUMNS

CREATE TABLE classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    teacher VARCHAR(100) NOT NULL,
    class_year INT NOT NULL
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    class_id INT,
    enrollment_year INT NOT NULL,
    
    FOREIGN KEY (class_id)
        REFERENCES classes(class_id)
);

INSERT INTO classes (class_id, class_name, teacher, class_year)
VALUES
(1, 'Math 101', 'Mr. Smith', 2021),
(2, 'English 1', 'Ms. Johnson', 2021),
(3, 'Science 1', 'Dr. Lee', 2022),
(4, 'History 1', 'Ms. Williams', 2022);


INSERT INTO students (
    student_id,
    first_name,
    last_name,
    class_id,
    enrollment_year
)
VALUES
(1, 'John',  'Smith',    1, 2021),
(2, 'Jane',  'Doe',      2, 2020),
(3, 'Bob',   'Johnson',  1, 2021),
(4, 'Sally', 'Brown',    3, 2022),
(5, 'Tom',   'Williams', 2, 2022),
(6, 'Alice', 'Davis',    4, 2020);

-----------------------------------------------------

SELECT * FROM students t1
JOIN classes t2
ON t1.class_id = t2.class_id
AND t1.enrollment_year = t2.class_year


SELECT * FROM classes

