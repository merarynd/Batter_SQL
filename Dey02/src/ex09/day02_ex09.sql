SELECT t1.name FROM person t1
INNER JOIN person_order t2 on t1.id = t2.person_id
INNER JOIN menu t3 on t2.menu_id = t3.id
WHERE t3.pizza_name = 'pepperoni pizza' AND gender = 'female'
intersect
SELECT t1.name FROM person t1
INNER JOIN person_order t2 on t1.id = t2.person_id
INNER JOIN menu t3 on t2.menu_id = t3.id
WHERE t3.pizza_name = 'cheese pizza' AND gender = 'female'
ORDER BY name;