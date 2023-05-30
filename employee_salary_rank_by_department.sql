--Eployee table with departments and salary

CREATE TABLE Employee_Department_Salary (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);

--Inserting values

INSERT INTO Employee_Department_Salary (EmployeeID, EmployeeName, Department, Salary)
VALUES
    (1, 'John Doe', 'Sales', 5000),
    (2, 'Jane Smith', 'HR', 4000),
    (3, 'Mark Johnson', 'IT', 6000),
    (4, 'Sarah Lee', 'Sales', 5500),
    (5, 'Mike Brown', 'IT', 7000);



SELECT *, RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS Rank
FROM Employee_Department_Salary;

SELECT *, DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS Dense_Rank
FROM Employee_Department_Salary;

SELECT *, ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS Row_Number
FROM Employee_Department_Salary;


--CTE

with r AS (
SELECT *, ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS Row_Number
FROM Employee_Department_Salary
)

SELECT *
FROM r
WHERE Row_Number = 2;