CREATE TABLE PERSON1 (
id int,
email varchar(255)
);


INSERT INTO PERSON1
VALUES
(1, 'a@b.com'),
(2, 'c@d.com'),
(3, 'a@b.com');

--Find DUplicate EMails

-- Method 1

SELECT email, COUNT(email) AS email_count
FROM PERSON1
GROUP BY email
HAVING COUNT(email) > 1;


-- METHOD 2: Self Join

SELECT DISTINCT p1.email, COUNT(p1.email) AS email_count
FROM PERSON1 p1
INNER JOIN PERSON1 p2
ON p1.email = p2.email AND p1.id <> p2.id
GROUP BY p1.email;


