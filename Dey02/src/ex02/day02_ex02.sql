SELECT
       COALESCE(t1.name, '-') AS person_name,
       t2.visit_date,
       COALESCE(t3.name, '-')AS pizzeria_name
FROM person t1
FULL JOIN (SELECT * FROM person_visits WHERE visit_date >= '2022-01-01' AND visit_date <= '2022-01-03') AS t2
    ON t1.id = t2.person_id
FULL JOIN pizzeria t3 ON t3.id = t2.pizzeria_id
ORDER BY person_name, t2.visit_date, pizzeria_name;