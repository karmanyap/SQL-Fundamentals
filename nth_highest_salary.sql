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

-- Second Highest Salary


-- Nth Highest Salary

SELECT DISTINCT * FROM Employee WHERE salary = 
         (
            SELECT MIN(salary) FROM Employee 
            WHERE  salary IN (
                                 SELECT DISTINCT TOP 3
                                     salary FROM Employee 
                                         ORDER BY salary DESC
                             )
        );


CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
        select max(salary) as getNthHighestSalary from
        (select salary, Dense_Rank() over (order by salary DESC) as rn from Employee) E where E.rn = @N
    );
END
