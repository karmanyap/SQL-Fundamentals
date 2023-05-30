--Creating table Insurance

CREATE TABLE Insurance (
    pid INT,
    tiv_2015 FLOAT,
    tiv_2016 FLOAT,
    lat FLOAT,
    lon FLOAT
);

--Insert values into Insurance table

INSERT INTO Insurance (pid, tiv_2015, tiv_2016, lat, lon)
VALUES
    (1, 10, 5, 10, 10),
    (2, 20, 20, 20, 20),
    (3, 10, 30, 20, 20),
    (4, 10, 40, 40, 40);




--Write an SQL query to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

--have the same tiv_2015 value as one or more other policyholders, and
--are not located in the same city like any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
--Round tiv_2016 to two decimal places.

SELECT ROUND(SUM(i1.tiv_2016), 2) as tiv_2016
FROM Insurance i1
WHERE EXISTS (SELECT *
              FROM Insurance i2
              WHERE i1.tiv_2015 = i2.tiv_2015
                    AND i1.pid <> i2.pid)
    AND NOT EXISTS (SELECT *
                    FROM Insurance i2
                    WHERE (i1.lat = i2.lat
                            AND i1.lon = i2.lon)
                          AND i1.pid <> i2.pid);

