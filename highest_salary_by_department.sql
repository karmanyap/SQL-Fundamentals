
-- Highest Salary by Department

WITH joined AS (
SELECT d.name DEPARTMENT, e.name AS EMPLOYEE, e.salary AS Salary, RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) rank
FROM Department d
JOIN Employee e
ON d.id = e.departmentID
)

SELECT Department, Employee, Salary
FROM joined
WHERE rank = 1;


-- Third actual rank by department

WITH joined AS (
SELECT d.name DEPARTMENT, e.name AS EMPLOYEE, e.salary AS Salary, ROW_NUMBER() OVER (PARTITION BY d.name ORDER BY e.salary DESC) rank
FROM Department d
JOIN Employee e
ON d.id = e.departmentID
)

SELECT Department, Employee, Salary
FROM joined
WHERE rank = 3;


-- Test for LAST_VALUE()

WITH joined AS (
SELECT d.name DEPARTMENT, e.name AS EMPLOYEE, 
		e.salary AS Salary, LAST_VALUE(d.name) OVER (PARTITION BY d.name ORDER BY e.salary DESC  
			RANGE BETWEEN 
            UNBOUNDED PRECEDING AND 
            UNBOUNDED FOLLOWING) rank
FROM Department d
JOIN Employee e
ON d.id = e.departmentID
)

SELECT Department, Employee, Salary
FROM joined;


-- Top 3 Salaries

WITH cte AS (
SELECT d.name DEPARTMENT, e.name AS EMPLOYEE, e.salary AS Salary, ROW_NUMBER() OVER (PARTITION BY d.name ORDER BY e.salary DESC) rank
FROM Department d
JOIN Employee e
ON d.id = e.departmentID
)
SELECT Department, Employee, Salary
FROM cte
WHERE rank <= 3;
