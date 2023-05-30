--Lead and Lag CTE examples

  SELECT id, name, 
		LEAD(name) OVER (ORDER BY id) AS NextName, 
		LAG(name) OVER (ORDER BY id) AS LastName
  FROM Customers;