------------Step 1. Select All Records from the Customers Table


SELECT * FROM customers;


------------Step 2. Find All Customers Who Have a Premium Subscription


SELECT * FROM customers WHERE subscription_level = 'Premium';


------------Step 3. Get Distinct States from the Customers Table, Sorted Alphabetically


SELECT DISTINCT state FROM customers ORDER BY state;


------------Step 4. Count the Number of Customers from the State of NY


SELECT COUNT(*) AS ny_customer_count FROM customers WHERE state = 'NY';


------------Step 5. List the Customer Name and Email Data for Customers with No Subscription End Date


SELECT full_name, email FROM customers WHERE subscription_end_date IS NULL;


------------Step 6. Create an Index on the State Column


CREATE INDEX idx_state ON customers(state);


------------Step 7. Insert a New Customer into the Customers Table


INSERT INTO customers (full_name, email, subscription_level, subscription_start_date, subscription_end_date, state)
VALUES ('John Doe', 'john.doe@example.com', 'Standard', '2024-10-01', NULL, 'TX');


------------Step 8. Update Emma Collins to a Premium Subscription


UPDATE customers SET subscription_level = 'Premium' WHERE full_name = 'Emma Collins';


------------Step 9. Count the Number of Accounts Who Have an .edu Email Address


SELECT COUNT(*) AS edu_email_count FROM customers WHERE email LIKE '%.edu';


------------Step 10. Delete All Customers Whose Subscription Has Expired (Assume Today is August 1, 2024)


DELETE FROM customers WHERE subscription_end_date < '2024-08-01';


------------Step 11. Select All Premium Customers in New York, Listing Their Name and Email Address, Sorted by Name in Ascending Order


SELECT full_name, email FROM customers WHERE subscription_level = 'Premium' AND state = 'NY' ORDER BY full_name;


------------Step 12. Create a New Table Called Meals


CREATE TABLE meals (
    meal_id SERIAL PRIMARY KEY,
    meal_name VARCHAR(255) NOT NULL,
    calories INT,
    price DECIMAL(10, 2),
    is_vegetarian BOOLEAN,
    subscription_level VARCHAR(50)
);


------------Step 13. Insert 3 Meals into the Meals Table


INSERT INTO meals (meal_name, calories, price, is_vegetarian, subscription_level) VALUES
('Veggie Stir-Fry', 300, 9.99, TRUE, 'Standard'),
('Chicken Alfredo', 600, 12.99, FALSE, 'Premium'),
('Quinoa Salad', 250, 8.99, TRUE, 'Standard');


------------Step 14. Insert Additional Meals into the Meals Table


INSERT INTO meals (meal_name, calories, price, is_vegetarian, subscription_level) VALUES
('Truffle Risotto', 700, 25.00, FALSE, 'Premium'),
('Lobster Mac & Cheese', 900, 28.00, FALSE, 'Premium'),
('Vegetable Quiche', 500, 11.00, TRUE, 'Standard'),
('Roasted Duck Breast', 700, 22.50, FALSE, 'Premium'),
('Mushroom Stroganoff', 500, 12.00, TRUE, 'Standard'),
('Filet Mignon', 700, 30.00, FALSE, 'Premium'),
('Greek Salad', 500, 9.00, TRUE, 'Standard'),
('Wild Mushroom Soup', 500, 14.00, TRUE, 'Premium'),
('Chicken Parmesan', 700, 13.50, FALSE, 'Standard'),
('Seafood Paella', 900, 26.00, FALSE, 'Premium');


------------Step 15. List the Meal Names of the First 5 Meals that are Vegetarian


SELECT meal_name
FROM meals
WHERE is_vegetarian = TRUE
LIMIT 5;


------------Step 16. Get All Meals Sorted by Calories in Descending Order and Then by Price in Ascending Order


SELECT *
FROM meals
ORDER BY calories DESC, price ASC;


------------Step 17. Update the Price of All Meals with Subscription Level 'Premium' to Increase by 5.00


UPDATE meals
SET price = price + 5.00
WHERE subscription_level = 'Premium';


------------Step 18. Calculate the Average, Max, and Min of the Price in the Meals Table


SELECT AVG(price) AS average_price, MAX(price) AS max_price, MIN(price) AS min_price
FROM meals;


------------Step 19. Get All Meals That Have a Price Between 10.00 and 20.00


SELECT *
FROM meals
WHERE price BETWEEN 10.00 AND 20.00;


------------Step BONUS: Add a New INT Column Named star_rating to Meals, Initialized to NULL


ALTER TABLE meals
ADD COLUMN star_rating INT DEFAULT NULL;


------------Step 20. Create a Table Called "oops" with Columns id (SERIAL PRIMARY KEY) and foo (INT)


CREATE TABLE oops (
    id SERIAL PRIMARY KEY,
    foo INT
);


------------Step 21. Drop the "oops" Table


DROP TABLE oops;


------------Step 22. Find the Number of Meals at Each Subscription Level


SELECT subscription_level, COUNT(*) AS meal_count
FROM meals
GROUP BY subscription_level;


------------Step 23. Find the Average Price for Meals at Each Subscription Level


SELECT subscription_level, AVG(price) AS average_price
FROM meals
GROUP BY subscription_level;


------------Step 24. Find the Average Calories for Vegetarian and Non-Vegetarian Meals


SELECT is_vegetarian, AVG(calories) AS average_calories
FROM meals
GROUP BY is_vegetarian;


------------Step 25. Find the Cheapest Meal Price at Each Subscription Level


SELECT subscription_level, MIN(price) AS cheapest_price
FROM meals
GROUP BY subscription_level;


------------Step 26. Find the Number of Customers in Each State, Sorted Alphabetically by State


SELECT state, COUNT(*) AS customer_count
FROM customers
GROUP BY state
ORDER BY state;


------------Step 27. Find the Number of Customers in Each State, Sorted by Number of Customers (Highest First), Showing Only States with at Least 5 Customers


SELECT state, COUNT(*) AS customer_count
FROM customers
GROUP BY state
HAVING COUNT(*) >= 5
ORDER BY customer_count DESC;
