-- =========================
-- USERS TABLE
-- =========================

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);

-- =========================
-- RESTAURANTS TABLE
-- =========================

CREATE TABLE restaurants (
    r_id INT PRIMARY KEY,
    r_name VARCHAR(100),
    cuisine VARCHAR(50)
);


-- =========================
-- DELIVERY PARTNER TABLE
-- =========================

CREATE TABLE delivery_partner (
    partner_id INT PRIMARY KEY,
    partner_name VARCHAR(100)
);


-- =========================
-- FOOD TABLE
-- =========================

CREATE TABLE food (
    f_id INT PRIMARY KEY,
    f_name VARCHAR(100),
    type VARCHAR(20)
);


-- =========================
-- MENU TABLE
-- =========================

CREATE TABLE menu (
    menu_id INT PRIMARY KEY,
    r_id INT,
    f_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (r_id) REFERENCES restaurants(r_id),
    FOREIGN KEY (f_id) REFERENCES food(f_id)
);

-- ORDERS TABLE

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    r_id INT,
    amount DECIMAL(10,2),
    date DATE,
    partner_id INT,
    delivery_time INT,
    delivery_rating INT,
    restaurant_rating INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (r_id) REFERENCES restaurants(r_id),
    FOREIGN KEY (partner_id) REFERENCES delivery_partner(partner_id)
);


-- =========================
-- ORDER DETAILS TABLE
-- =========================

CREATE TABLE order_details (
    id INT PRIMARY KEY,
    order_id INT NOT NULL,
    f_id INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (f_id) REFERENCES food(f_id)
);

INSERT INTO order_details (id, order_id, f_id)
VALUES
(1, 1001, 1),
(2, 1001, 3),
(3, 1002, 4),
(4, 1002, 3),
(5, 1003, 6);