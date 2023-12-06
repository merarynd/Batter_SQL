SELECT t4.address AS address, t3.name, COUNT(*) AS count_of_orders
FROM person_order t1
    INNER JOIN menu t2 ON t2.id = t1.menu_id
    INNER JOIN pizzeria t3 ON t3.id = t2.pizzeria_id
    INNER JOIN person t4 ON t4.id = t1.person_id
GROUP BY 2, address
ORDER BY address, 2;