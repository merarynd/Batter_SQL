SELECT t1.pizza_name, p1.name AS pizzeria_name_1, p2.name AS pizzeria_name_2, t1.price
FROM menu t1
INNER JOIN menu t2 ON NOT t1.id = t2.id AND t1.price = t2.price
AND t1.pizzeria_id > t2.pizzeria_id AND t1.pizza_name = t2.pizza_name
INNER JOIN pizzeria p1 ON t1.pizzeria_id = p1.id
INNER JOIN pizzeria p2 ON t2.pizzeria_id = p2.id
ORDER BY t1.pizza_name;