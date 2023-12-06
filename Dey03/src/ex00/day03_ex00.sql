SELECT t1.pizza_name, t1.price, t2.name AS pizzeria_name, t3.visit_date
FROM menu t1
INNER JOIN pizzeria t2 ON t2.id = t1.pizzeria_id
INNER JOIN person_visits t3 ON t2.id = t3.pizzeria_id
INNER JOIN person t4 ON t3.person_id = t4.id
WHERE t4.name = 'Kate' AND price BETWEEN 800 AND 1000
ORDER BY t1.pizza_name, t1.price, t2.name;