SELECT pizza_name, t2.name AS pizzeria_name, price FROM menu t1
FULL JOIN pizzeria t2 ON t1.pizzeria_id = t2.id
WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, t2.name;
