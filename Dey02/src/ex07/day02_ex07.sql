SELECT t2.name AS pizzeria_name FROM menu t1
INNER JOIN pizzeria t2 ON  t2.id = t1.pizzeria_id
INNER JOIN person_visits t3 ON t1.pizzeria_id = t3.pizzeria_id
INNER JOIN person t4 ON t4.id = t3.person_id
WHERE t4.name = 'Dmitriy' AND t3.visit_date = '2022-01-08' AND t1.price < 800;