CREATE TABLE Employee_Department (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50)
);

INSERT INTO Employee_Department (EmployeeID, EmployeeName, Department)
VALUES
    (1, 'John Doe', 'Sales'),
    (2, 'Jane Smith', 'HR'),
    (3, 'Mark Johnson', 'Sales'),
    (4, 'Sarah Lee', 'HR'),
    (5, 'Mike Brown', 'IT');

--CTE to find names of employees with the same department as John Doe

WITH d AS (
SELECT Department
FROM Employee_Department
WHERE EmployeeName = 'John Doe'
)
SELECT EmployeeID, EmployeeName
	FROM Employee_Department e
		WHERE Department = (
			Select * 
			FROM d)
			AND e.EmployeeName <> 'John Doe';

--Alternate method


WITH d AS (
SELECT Department
FROM Employee_Department
WHERE EmployeeName = 'John Doe'
)
SELECT EmployeeID, EmployeeName
	FROM Employee_Department e
	JOIN d
	ON e.Department = d.Department
	WHERE e.EmployeeName <> 'John Doe';
