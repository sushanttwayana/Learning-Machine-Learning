CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    state VARCHAR(100),
    city VARCHAR(100)
);

-- DROP TABLE users


CREATE TABLE category (
    category_id INT PRIMARY KEY,
    category VARCHAR(100) NOT NULL,
    vertical VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    order_id VARCHAR(100) PRIMARY KEY,
    user_id INT,
    order_date VARCHAR(100),

    FOREIGN KEY (user_id)
        REFERENCES users(user_id)
);



DROP TABLE IF EXISTS order_details;

CREATE TABLE order_details (
    order_id VARCHAR(100),
    amount FLOAT,
    profit DOUBLE PRECISION,
    quantity INT,
    category_id INT,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (category_id)
        REFERENCES category(category_id)
);

SELECT *
FROM order_details;


COPY order_details(
    order_id,
    amount,
    profit,
    quantity,
    category_id
)
FROM 'G:/sushant/Downloads/order_details.csv'
WITH (
    FORMAT csv,
    HEADER true
);



