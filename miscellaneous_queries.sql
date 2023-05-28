-- 5/27/2023

-- Create the 'categories' table
CREATE TABLE categories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50)
);

-- Insert values into the 'categories' table
INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home Appliances');


-- Create the 'products' table
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  category_id INT,
  price DECIMAL(10, 2),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Insert values into the 'products' table
INSERT INTO products (product_id, product_name, category_id, price) VALUES
(1, 'Smartphone', 1, 599.99),
(2, 'Laptop', 1, 1299.99),
(3, 'T-Shirt', 2, 19.99),
(4, 'Dress', 2, 49.99),
(5, 'Refrigerator', 3, 899.99),
(6, 'Washing Machine', 3, 699.99);

INSERT INTO products (product_id, product_name, category_id, price)
VALUES
    (7, 'Product 7', 1, 199.99),
    (8, 'Product 8', 1, 299.99),
    (9, 'Product 9', 2, 399.99),
    (10, 'Product 10', 2, 499.99),
    (11, 'Product 11', 3, 599.99),
    (12, 'Product 12', 3, 699.99),
    (13, 'Product 13', 1, 799.99),
    (14, 'Product 14', 1, 899.99),
    (15, 'Product 15', 2, 999.99),
    (16, 'Product 16', 2, 1099.99),
    (17, 'Product 17', 3, 1199.99),
    (18, 'Product 18', 3, 1299.99),
    (19, 'Product 19', 1, 1399.99),
    (20, 'Product 20', 2, 1499.99);



	--DELETE FROM products 
	--where product_id BETWEEN 7 AND 20;

-- Create the 'sales' table
CREATE TABLE sales (
  sale_id INT PRIMARY KEY,
  product_id INT,
  customer_id INT,
  purchase_date DATE,
  purchase_amount DECIMAL(10, 2),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert values into the 'sales' table
INSERT INTO sales (sale_id, product_id, customer_id, purchase_date, purchase_amount) VALUES
(1, 1, 1001, '2022-05-10', 599.99),
(2, 2, 1002, '2022-06-15', 1299.99),
(3, 3, 1003, '2022-07-20', 19.99),
(4, 4, 1001, '2022-08-05', 49.99),
(5, 5, 1002, '2022-09-10', 899.99),
(6, 6, 1003, '2022-10-15', 699.99);

INSERT INTO sales (sale_id, product_id, customer_id, purchase_date, purchase_amount)
VALUES
    (7, 7, 1004, '2023-02-20', 299.99),
    (8, 8, 1005, '2023-03-05', 199.99),
    (9, 9, 1006, '2023-03-10', 149.99),
    (10, 10, 1007, '2023-03-15', 99.99);

INSERT INTO sales (sale_id, product_id, customer_id, purchase_date, purchase_amount)
VALUES
    (11, 11, 1008, '2023-03-20', 399.99),
    (12, 12, 1009, '2023-03-25', 1499.99),
    (13, 13, 1010, '2023-03-30', 59.99),
    (14, 14, 1011, '2023-04-05', 199.99),
    (15, 15, 1012, '2023-04-10', 799.99),
    (16, 16, 1013, '2023-04-15', 699.99),
    (17, 17, 1014, '2023-04-20', 299.99),
    (18, 18, 1015, '2023-04-25', 499.99),
    (19, 19, 1016, '2023-04-30', 399.99),
    (20, 20, 1017, '2023-05-05', 249.99);

--DELETE FROM sales
--WHERE sale_id BETWEEN 7 and 20;

-- 1. What is SQL, and how is it used in data analysis?
--SQL (Structured Query Language) is a programming language used to manage and manipulate relational databases. In data analysis, SQL is used to retrieve, filter, aggregate, and analyze data stored in databases.

-- 2. Explain the differences between INNER JOIN, LEFT JOIN, and RIGHT JOIN in SQL.

--INNER JOIN returns only the matching records from both tables.
--LEFT JOIN returns all records from the left table and the matching records from the right table.
--RIGHT JOIN returns all records from the right table and the matching records from the left table.


-- 3. How would you retrieve the top 5 customers based on their total purchase amount from a sales table?

SELECT *
FROM sales;

SELECT TOP 5 customer_id, SUM(purchase_amount) AS total_sale_amount
FROM sales
GROUP BY customer_id
ORDER BY total_sale_amount DESC;


-- 4. Can you explain the concept of subqueries in SQL and provide an example of how they can be used?
--A subquery is a query embedded within another query. It allows you to use the results of one query in another query. 

SELECT product_name
FROM products
WHERE category_id IN
(
SELECT category_id
FROM categories
WHERE category_name = 'Electronics'
)
ORDER BY product_name;

--5.How would you calculate the average revenue per customer for a specific time period using SQL?

-- I added average function- AVG(TotalRevenue) to give me average revenue per customer coming to 1189.980000
-- I added ROUND function -  ROUND(AVG(TotalRevenue), 0) to update the value to 1190.00000
-- I added CAST function - CAST(ROUND(AVG(TotalRevenue), 0) AS INT) to convert the float decimal number into an int - whole number value of 1190

SELECT CAST(ROUND(AVG(TotalRevenue), 0) AS INT) AS AverageRevenuePerCustomer
FROM (
	SELECT customer_id, SUM(purchase_amount) AS TotalRevenue
	FROM sales
	WHERE YEAR(purchase_date) = 2022
	GROUP BY customer_id
) AS RevenueByCustomer;


--6. What is the purpose of the GROUP BY clause in SQL? Provide an example query that uses GROUP BY.
--The GROUP BY clause is used to group rows based on one or more columns.

SELECT category_id, COUNT(*) AS product_count
FROM products
GROUP BY category_id;

--7. How would you identify and remove duplicate records from a table using SQL?

SELECT product_id, category_id
FROM products
GROUP BY product_id, category_id
HAVING COUNT(*) > 1;

--To remove duplicate records, you can use the DELETE statement with a self-join or temporary table.

-- Self-Join exmaple

SELECT p1.product_name AS product1, p2.product_name AS product2
	FROM products p1
	INNER JOIN 
		products p2 
			ON p1.category_id = p2.category_id
			WHERE p1.product_id <> p2.product_id;


-- Checking values in products table

SELECT *
FROM products;

-- Inserting 5 duplicate values in the products table

INSERT INTO products
VALUES
(21, 'Smartphone', 1, 799.99),
(22, 'Laptop', 1, 799.99),
(23, 'T-Shirt', 2, 799.99),
(24, 'Dress', 2, 799.99),
(25, 'Refrigerator', 3, 799.99);

-- Selecting duplicate values. We see the 5 new duplicate values based on product name. The assumption applied is each new product would have an auto-incremented product_id.
-- With this assumption, it would be logical to delete new products rows, or products with higher product_id.

SELECT p1.*
FROM products p1, products p2
WHERE p1.product_id > p2.product_id
AND p1.product_name = p2.product_name;

-- Delete duplicate values if it existed in the products table. This code would delete records coming in later in the table (greater product_id)

DELETE p1
FROM products p1, products p2
WHERE p1.product_id > p2.product_id
AND p1.product_name = p2.product_name;

-- Checking for duplicate values again to see that the recent duplicate values have been deleted.

SELECT p1.*
FROM products p1, products p2
WHERE p1.product_id > p2.product_id
AND p1.product_name = p2.product_name;


--8. Explain the differences between UNION and UNION ALL in SQL.

--UNION combines the result sets of two or more SELECT statements, removing duplicate rows.
--UNION ALL also combines the result sets of SELECT statements but does not remove duplicate rows.

--9. How would you write a query to find the total number of products sold in each category?

SELECT c.category_name, COUNT(*) AS total_products_sold
FROM sales s
JOIN products p
ON s.product_id = p.product_id
JOIN categories c
ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_products_sold DESC;

-- JOIN is default for INNER JOIN

SELECT c.category_name, COUNT(*) AS total_products_sold
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
INNER JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name;


--10. Can you explain the concept of indexing in SQL? How does it improve query performance?
--Indexing is a technique used to improve the performance of database queries by creating a data structure that allows for quick data retrieval. 
--It speeds up query execution by reducing the number of disk I/O operations required to locate the desired data.

--11.How would you handle NULL values in SQL queries? Provide examples of functions that can be used to handle NULLs.
--Functions like IS NULL, IS NOT NULL, COALESCE, and NULLIF can be used to handle NULL values. Examples:

--i. COALESCE:
--The COALESCE function allows you to return the first non-NULL expression from a list of values. It takes multiple arguments and returns the first non-NULL value.
--You can use it in SELECT statement statements or other expressions.

SELECT COALESCE(sale_id, 'N/A') AS result
FROM sales;

-- In this example, if 'sale_id' is NULL, the result will be 'N/A'.

--ii. IS NULL:
--The IS NULL operator checks if a column or expression is NULL. It returns TRUE(1) if the value is NULL and FALSE(0) otherwise.
--It can be used in WHERE clauses or conditional statements.

SELECT *
FROM sales
WHERE sale_id IS NULL;

--iii. ISNULL:
--The ISNULL function returns a specified replacement value if the expression is NULL. It takes two arguments: the expression to be checked and the replacement value.

SELECT ISNULL(sale_id, 'N/A') AS result
FROM sales;


--iv. NULLIF:
--The NULLIF function compares two expressions and returns NULL if they are equal. 
--It can be used to handle specific cases where you want to treat certain values as NULL.

SELECT NULLIF(CAST((sale_id) AS VARCHAR(50)), 'N/A') AS result
FROM sales;




