SELECT t2.name, t3.pizza_name, t3.price, (t3.price - t3.price*t5.discount/100) AS discount_price, t4.name AS pizzeria_name
FROM person_order t1
INNER JOIN person t2 ON t2.id = t1.person_id
INNER JOIN menu t3 ON t3.id = t1.menu_id
INNER JOIN pizzeria t4 ON t4.id = t3.pizzeria_id
INNER JOIN person_discounts t5  ON t1.person_id = t5.person_id AND t5.pizzeria_id = t3.pizzeria_id
ORDER BY t2.name, t3.pizza_name;