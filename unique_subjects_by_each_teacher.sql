-- Create Teacher Table

CREATE TABLE Teacher (
teacher_id int,
subject_id int,
dept_id int
);

-- Inserting Values into Teacher table

INSERT INTO Teacher
VALUES
(1,2,3),
(1,2,4),
(1,3,3),
(2,1,1),
(2,2,1),
(2,3,1),
(2,4,1);

--Write an SQL query to report the number of unique subjects each teacher teaches in the university.

--Return the result table in any order.

--The query result format is shown in the following example.

SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;




