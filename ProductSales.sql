CREATE TABLE Product_Sales (
    ProductID INT,
    SalesAmount DECIMAL(10,2)
);

INSERT INTO Product_Sales (ProductID, SalesAmount)
VALUES
    (1, 1000),
    (2, 1500),
    (1, 2000),
    (3, 500),
    (2, 3000),
    (4, 1200),
    (5, 1800);

SELECT ProductID, SalesAmount, SUM(SalesAmount) OVER (PARTITION BY ProductID ORDER BY SalesAmount DESC) AS TotalSales
FROM Product_Sales;

