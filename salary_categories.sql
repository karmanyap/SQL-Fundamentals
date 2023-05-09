--Create Table Accounts

CREATE TABLE Accounts (
account_id int,
income int
);


-- Insert values into Accounts table

INSERT INTO Accounts
VALUES
(3,108939),
(2,12747),
(8,87709),
(6,91796);

-- Checking if all values are inserted as expected

SELECT * FROM Accounts;


--Write an SQL query to report the number of bank accounts of each salary category. The salary categories are:

--"Low Salary": All the salaries strictly less than $20000.
--"Average Salary": All the salaries in the inclusive range [$20000, $50000].
--"High Salary": All the salaries strictly greater than $50000.
--The result table must contain all three categories. If there are no accounts in a category, then report 0.

--Return the result table in any order.

WITH cte AS 
(
    SELECT CASE 
        WHEN income < 20000 THEN 'Low Salary'
        WHEN income >= 20000 AND income<=50000 THEN 'Average Salary'
        ELSE 'High Salary' END cat, 1 cnt
    FROM accounts
    UNION ALL
    SELECT 'Low Salary', 0 
    UNION ALL
    SELECT 'Average Salary', 0
    UNION ALL
    SELECT 'High Salary', 0
)
SELECT cat category, SUM(cnt) accounts_count
FROM cte
GROUP BY cat



