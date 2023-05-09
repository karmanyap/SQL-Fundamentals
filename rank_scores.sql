
CREATE TABLE Scores (
id int,
score decimal (10,2)
);


INSERT INTO Scores
VALUES
(1,3.50),
(2,3.65),
(3,4.00),
(4,3.85),
(5,4.00),
(6,3.65);

SELECT * FROM Scores;

--Write an SQL query to rank the scores. The ranking should be calculated according to the following rules (https://leetcode.com/problems/rank-scores/):

--The scores should be ranked from the highest to the lowest.
--If there is a tie between two scores, both should have the same ranking.
--After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
--Return the result table ordered by score in descending order.


SELECT score, DENSE_RANK() OVER (ORDER BY score DESC) rank
FROM Scores;


-- DELETE FROM Scores;
