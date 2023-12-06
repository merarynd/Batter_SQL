SELECT
       (SELECT name FROM person per WHERE per.id = pv.person_id) AS person_name,  -- this is an internal query in a main SELECT clause
       (SELECT name FROM pizzeria piz WHERE piz.id = pv.pizzeria_id) AS pizzeria_name  -- this is an internal query in a main SELECT clause
FROM
     (SELECT * FROM person_visits pv WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09') AS pv -- this is an internal query in a main FROM clause
ORDER BY person_name, pizzeria_name DESC;
