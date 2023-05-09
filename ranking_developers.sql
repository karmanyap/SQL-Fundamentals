SELECT COUNT(*), JobTitle FROM EmployeeSalary
GROUP BY JobTitle;

CREATE TABLE developers (
id int,
first_name varchar(255),
last_name varchar(255),
level varchar(255),
years_experience int);


INSERT INTO developers
VALUES
(10, 'Jack', 'Davis', 'junior', 1),
(11, 'Helen', 'Brown', 'junior', 0),
(12, 'Kate', 'Williams', 'senior', 4),
(13, 'Alex', 'Miller', 'senior', 8),
(14, 'Sophia', 'Moore', 'mid-level', 3),
(15, 'Nick', 'Jackson', 'mid-level', 3),
(16, 'Steven', 'Martin', 'junior', 2),
(17, 'Megan', 'Stevens', 'junior', 1),
(18, 'John', 'Jones', 'senior', 5),
(19, 'Max', 'Weber', 'mid-level', 4);


-- Rank by years of experience

SELECT *, RANK() OVER (ORDER BY years_experience DESC) AS rank
FROM developers;

-- Ranking with different groups

SELECT *, 
	RANK() OVER(PARTITION BY level ORDER BY years_experience DESC) partition_rank
FROM developers;


-- Dense Rank and row number

SELECT *,
	RANK() OVER (ORDER BY years_experience DESC) rank,
	DENSE_RANK() OVER (ORDER BY years_experience DESC) dense_rank,
	ROW_NUMBER() OVER (ORDER BY years_experience DESC) row_number
FROM developers;


-- Top 3 salaries by department

select d.Name as 'Department', e1.Name as 'Employee', e1.Salary
from Employee e1
join Department d 
on e1.DepartmentId = d.Id
where 3 > (select count(distinct e2.Salary)
            from Employee e2
            where e2.Salary > e1.Salary
                and e1.DepartmentId = e2.DepartmentId)
ORDER BY Department, Salary DESC;
