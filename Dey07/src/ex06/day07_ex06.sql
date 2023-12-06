SELECT t3.name AS name, COUNT(*) AS count_of_orders, ROUND(AVG(price), 2) AS average_price,
       MAX(price) AS max_price, MIN(price) AS min_price
FROM person_order t1
    INNER JOIN menu t2 ON t2.id = t1.menu_id
    INNER JOIN pizzeria t3 ON t3.id = t2.pizzeria_id
GROUP BY name
ORDER BY name;