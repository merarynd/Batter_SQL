WITH t1 AS
    (SELECT t1::date
FROM generate_series('2022-01-01','2022-01-10', INTERVAL '1 day') AS t1)
SELECT t1::date AS missing_date
FROM (SELECT * FROM person_visits t2 WHERE person_id = 1 OR person_id = 2) AS t2
RIGHT JOIN t1 AS t1
ON t2.visit_date = t1
WHERE t2.visit_date IS NULL
ORDER BY missing_date;