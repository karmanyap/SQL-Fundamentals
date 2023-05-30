
--Creating an Employee Table with manager id

CREATE TABLE EmployeeManager (
    id INT,
    name VARCHAR(50),
    salary INT,
    managerId INT
);


INSERT INTO EmployeeManager (id, name, salary, managerId)
VALUES
    (1, 'Joe', 70000, 3),
    (2, 'Henry', 80000, 4),
    (3, 'Sam', 60000, NULL),
    (4, 'Max', 90000, NULL);

--Employees Earning More Than Their Managers

SELECT e1.name AS Employee
FROM EmployeeManager e1
JOIN EmployeeManager e2
ON e1.managerId = e2.Id
WHERE e1.salary > e2.salary;


