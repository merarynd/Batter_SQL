SELECT pizza_name, price, t3.name AS pizzeria_name
FROM (
SELECT id
FROM menu
EXCEPT
SELECT menu_id
FROM person_order) AS t1
INNER JOIN menu t2 on t2.id = t1.id
INNER JOIN pizzeria t3 ON t2.pizzeria_id = t3.id
ORDER BY pizza_name, price;
