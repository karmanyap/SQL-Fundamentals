
--Create table Customers

CREATE TABLE Customers (
    id INT,
    name VARCHAR(50)
);

--Create table Orders

CREATE TABLE Orders (
    id INT,
    customerId INT
);

--Adding values in Customers table

INSERT INTO Customers (id, name)
VALUES
    (1, 'Joe'),
    (2, 'Henry'),
    (3, 'Sam'),
    (4, 'Max');

--Adding values into Orders table

INSERT INTO Orders (id, customerId)
VALUES
    (1, 3),
    (2, 1);


--Write an SQL query to report all customers who never order anything. Return the result table in any order.

SELECT c.name AS Customers
FROM Customers c
LEFT JOIN
Orders o
ON c.id = o.customerId
WHERE o.customerId IS NULL;

