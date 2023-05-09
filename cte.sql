-- Create sales table

CREATE TABLE sales (
branch varchar(255), 
date date, 
seller varchar(255), 
item varchar(255), 
quantity int, 
unit_price int
);

-- Insert values into sales table

INSERT INTO sales
VALUES
('Paris-1', '2021-12-07', 'Charles', 'Headphones A2', 1, 80),
('London-1', '2021-12-06', 'John', 'Cell Phone X2', 2, 120),
('London-2', '2021-12-07', 'Mary', 'Headphones A1', 1, 60),
('Paris-1', '2021-12-07', 'Charles', 'Battery Charger', 1, 50),
('London-2', '2021-12-07', 'Mary', 'Cell Phone B2', 2, 90),
('London-1', '2021-12-07', 'John', 'Headphones A0', 5, 75),
('London-1', '2021-12-07', 'Sean', 'Cell Phone X1', 2, 100);


-- sales by branch

SELECT branch, COUNT(branch) AS sales_by_branch
FROM sales
GROUP BY branch
ORDER BY branch;

-- Most expensive item in the same branch that day

WITH highest AS (
	SELECT branch, date, MAX(unit_price) AS highest_price
	FROM sales
	GROUP BY branch, date
)
SELECT sales.*, h.highest_price
FROM sales
JOIN highest h
ON sales.branch = h.branch AND sales.date = h.date;


SELECT branch, date, AVG(unit_price)
FROM sales
GROUP BY branch, date;

SELECT * FROM sales

