-- 1. Select all the records from the customers table.
SELECT * FROM customers;

-- 2. Find all customers who have a Premium subscription.
SELECT * FROM customers WHERE subscription_level = 'Premium';

-- 3. Get distinct states from the customers table. Sort alphabetically.
SELECT DISTINCT state FROM customers ORDER BY state;

-- 4. Count the number of customers from the state of NY.
SELECT COUNT(*) FROM customers WHERE state = 'NY';

-- 5. List the customer name and email data for customers with no subscription end date.
SELECT customer_name, email FROM customers WHERE subscription_end_date IS NULL;

-- 6. Create an index on the state column.
CREATE INDEX idx_state ON customers(state);

-- 7. Insert a new customer into the customers table.
INSERT INTO customers (customer_name, email, state, subscription_level) VALUES ('John Doe', 'john.doe@example.com', 'CA', 'Basic');

-- 8. Update Emma Collins to a Premium subscription.
UPDATE customers SET subscription_level = 'Premium' WHERE customer_name = 'Emma Collins';

-- 9. Count the number of accounts who have an .edu email address.
SELECT COUNT(*) FROM customers WHERE email LIKE '%.edu';

-- 10. Delete all customers whose subscription has expired (assume the date today is August 1, 2024).
DELETE FROM customers WHERE subscription_end_date < '2024-08-01';

-- 11. Select all premium customers in New York, listing their name and email address. Sort by name in ascending order.
SELECT customer_name, email FROM customers WHERE subscription_level = 'Premium' AND state = 'NY' ORDER BY customer_name;

-- 12. Create a new table called meals.
CREATE TABLE meals (
    meal_id SERIAL PRIMARY KEY,
    meal_name VARCHAR(255) NOT NULL,
    calories INT,
    price DECIMAL(10, 2),
    is_vegetarian BOOLEAN,
    subscription_level VARCHAR(50)
);

-- 13. Insert 3 meals into the meals table.
INSERT INTO meals (meal_name, calories, price, is_vegetarian, subscription_level) VALUES
('Vegetable Stir Fry', 300, 12.50, TRUE, 'Premium'),
('Chicken Salad', 400, 15.00, FALSE, 'Basic'),
('Quinoa Bowl', 350, 10.00, TRUE, 'Standard');

-- 14. List the meal names of the first 5 meals that are vegetarian.
SELECT meal_name FROM meals WHERE is_vegetarian = TRUE LIMIT 5;

-- 15. Get all meals sorted by calories in descending order and then by price in ascending order.
SELECT * FROM meals ORDER BY calories DESC, price ASC;

-- 16. Update the price of all meals with subscription_level 'Premium' to increase by 5.00.
UPDATE meals SET price = price + 5.00 WHERE subscription_level = 'Premium';

-- 17. Calculate the average, max, and min of the price in the meals table.
SELECT AVG(price) AS average_price, MAX(price) AS max_price, MIN(price) AS min_price FROM meals;

-- 18. Get all meals that have a price between 10.00 and 20.00.
SELECT * FROM meals WHERE price BETWEEN 10.00 AND 20.00;

-- BONUS: Add a new INT column named star_rating to meals, initialized to NULL.
ALTER TABLE meals ADD COLUMN star_rating INT;

-- Create a table called "oops" with columns id (SERIAL PRIMARY KEY) and foo (INT).
CREATE TABLE oops (
    id SERIAL PRIMARY KEY,
    foo INT
);

-- Drop the "oops" table.
DROP TABLE oops;
