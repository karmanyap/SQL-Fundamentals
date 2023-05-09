---- Create Employee Table

--CREATE TABLE Employee (
--id int,
--name varchar(255),
--salary int,
--departmentID int
--);

---- Create Department Table

--CREATE TABLE Department (
--id int,
--name varchar(255)
--);

-- Insert Values into Employee Table

INSERT INTO Employee
VALUES
(1, 'Joe', 70000,1),
(2, 'Jim', 90000,1),
(3, 'Henry', 80000,2),
(4, 'Sam', 60000,2),
(5, 'Max', 90000,1);

-- Check that values are inserted as expected into Employee Table

SELECT * FROM Employee;

-- Insert Values into Department Table

INSERT INTO Department
VALUES
(1,'IT'),
(2,'Sales');

-- Check that values are inserted as expected into Employee Table

SELECT * FROM Department;

-- Highest Salary by Department

--Write an SQL query to find employees who have the highest salary in each of the departments.

--Return the result table in any order.

--The query result format is in the following example.



-- Approach 1: Subquery | Group By | Join

SELECT d.name as Department, e.name as Employee, e.salary as Salary 
FROM Employee e join Department d on e.departmentId = d.id
WHERE 1 > (SELECT count(salary) 
			FROM Employee e1 
			WHERE e1.salary > e.salary and e1.departmentId = e.departmentId
			);

-- Approach 2: Subquery | Group By | Join

SELECT d.name as Department, e.name as Employee, e.salary as Salary 
FROM Employee e join Department d on e.departmentId = d.id
WHERE e.salary = (SELECT max(salary) 
				  FROM Employee e1 group by e1.departmentId  
				  HAVING e1.departmentId = e.departmentId
				  );

-- Using WITH

WITH joined as(
SELECT d.name Department,
e.name as Employee, 
e.salary as Salary,
RANK() over (PARTITION BY d.name ORDER BY e.salary DESC) rank 
FROM Department d 
JOIN Employee e on d.id = e.departmentId
) 

select 
Department,Employee, Salary
from joined 
WHERE rank = 1


-- RANK Exercise

SELECT id, name, salary, departmentID, RANK() OVER (ORDER BY salary DESC)
FROM Employee;


