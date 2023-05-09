-- Create Table Employees

CREATE TABLE Employees (
id int,
name varchar(255)
);

-- Create Table EmployeeUNI. (id, unique_id) is the primary key.

CREATE TABLE EmployeeUNI (
id int,
unique_id int);

-- Insert values into Emplyees

INSERT INTO Employees
VALUES
(1, 'Alice'),
(7, 'Bob'),
(11,'Meir'),
(90,'Winston'),
(3,'Jonathan');

-- Insert vakues into EmployeesUNI

INSERT INTO EmployeeUNI
VALUES
(3,1),
(11,2),
(90,3);




