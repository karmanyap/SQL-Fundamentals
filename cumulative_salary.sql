 -- Cumulative Salary ordered by EmployeeID 

  SELECT EmployeeID, JobTitle, Salary, SUM(Salary) OVER (ORDER BY EmployeeID) AS CumulativeSalary
  FROM EmployeeSalary;

  -- Cumulative salary without order by. This shall present overall salary in CumulativeSalary by partition without a running sum

  SELECT EmployeeID, JobTitle, Salary, SUM(Salary) OVER (PARTITION BY Salary) AS CumulativeSalary
  FROM EmployeeSalary
  WHERE JobTitle = 'Accountant';

  --Cumulative Salary partitioned by Job titled and ordered by Salary. This would count the running sum by the partiotion - JobTitle in this instance and order the records by salary in ascending order,
  --and filter for JobTitle Accountant..

  SELECT EmployeeID, JobTitle, Salary, SUM(Salary) OVER (PARTITION BY JobTitle ORDER BY Salary) AS CumulativeSalary
  FROM EmployeeSalary
  WHERE JobTitle = 'Accountant';

  --Cumulative Salary partitioned by Job titled and ordered by EmployeeID. This would count the running sum by the partiotion - JobTitle in this instance and order the records by salary in ascending order,
  --and filter for JobTitle Accountant..

  SELECT EmployeeID, JobTitle, Salary, SUM(Salary) OVER (PARTITION BY JobTitle ORDER BY EmployeeID) AS CumulativeSalary
  FROM EmployeeSalary
  WHERE JobTitle = 'Accountant';


