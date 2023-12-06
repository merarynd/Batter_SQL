CREATE VIEW v_symmetric_union AS
(SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-02' -- фильтр для R
EXCEPT
SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-06') -- фильтр для S
UNION
(SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-06' -- фильтр для S
EXCEPT
SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-02') -- фильтр для R
ORDER BY person_id;