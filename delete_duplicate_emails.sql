
--Create PersonEmail table

CREATE TABLE PersonEmail (
    id INT,
    email VARCHAR(100)
);

--Insert values into PersonEmail table

INSERT INTO PersonEmail (id, email)
VALUES
    (1, 'john@example.com'),
    (2, 'bob@example.com'),
    (3, 'john@example.com');

--Checking for duplicate emails

SELECT DISTINCT p2.*
FROM PersonEmail p1
JOIN PersonEmail p2
ON p1.email = p2.email
WHERE p2.id > p1.id;

--deleting duplicate emails

DELETE FROM PersonEmail
WHERE id IN
(SELECT p2.id
FROM PersonEmail p1
JOIN PersonEmail p2
ON p1.email = p2.email
WHERE p2.id > p1.id);

--Alternate method to delete

DELETE FROM PersonEmail
WHERE id IN
(
SELECT p2.id
FROM PersonEmail p1, PersonEmail p2
WHERE p1.email = p2.email AND p2.id > p1.id 
)