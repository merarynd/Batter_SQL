SELECT t2.name AS person_name, t3.pizza_name, t4.name AS pizzeria_name
FROM person_order t1
INNER JOIN person t2 on t2.id = t1.person_id
INNER JOIN menu t3 on t3.id = t1.menu_id
INNER JOIN pizzeria t4 on t3.pizzeria_id = t4.id
ORDER BY t2.name, t3.pizza_name, t4.name;