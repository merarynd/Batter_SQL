CREATE VIEW v_price_with_discount AS
SELECT t2.name, t3.pizza_name, t3.price, (t3.price - t3.price * 0.1) AS discount_price
FROM person_order t1
INNER JOIN person t2 ON t1.person_id = t2.id
INNER JOIN menu t3 ON t1.menu_id = t3.id
ORDER BY t2.name, t3.pizza_name;