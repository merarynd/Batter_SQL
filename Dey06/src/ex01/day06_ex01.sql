INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT
       ROW_NUMBER() OVER() AS id, person_id, pizzeria_id,
       CASE
           WHEN COUNT(*) = 1 THEN 10.5
           WHEN COUNT(*) = 2 THEN 22
           ELSE 30
       END AS discount
FROM person_order t1
JOIN menu t2 ON  t1.menu_id = t2.id
GROUP BY t1.person_id, t2.pizzeria_id;