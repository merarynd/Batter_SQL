SELECT t3.pizza_name AS pizza_name, t4.name AS pizzeria_name FROM person_order t1
INNER JOIN person t2 ON t2.id = t1.person_id
INNER JOIN menu t3 ON t3.id = t1.menu_id
INNER JOIN pizzeria t4 ON t4.id = t3.pizzeria_id
WHERE t2.name = 'Denis' OR t2.name = 'Anna'
ORDER BY pizza_name, pizzeria_name;