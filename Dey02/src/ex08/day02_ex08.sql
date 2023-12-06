SELECT t1.name FROM person t1
INNER JOIN person_order t2 on t1.id = t2.person_id
INNER JOIN menu t3 on t2.menu_id = t3.id
WHERE (t1.address = 'Moscow' OR t1.address = 'Samara')
  AND (t3.pizza_name = 'pepperoni pizza' OR t3.pizza_name = 'mushroom pizza')
  AND gender = 'male'
ORDER BY t1.name DESC ;
