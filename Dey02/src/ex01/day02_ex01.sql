SELECT t1::date AS missing_date
FROM generate_series('2022-01-01','2022-01-10', INTERVAL '1 day') AS t1
LEFT JOIN (
    SELECT *
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2 ) AS t2
ON t2.visit_date = t1
WHERE t2.visit_date IS NULL
ORDER BY missing_date;