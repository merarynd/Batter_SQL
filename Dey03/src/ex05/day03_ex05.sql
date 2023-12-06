SELECT t3.name
FROM person_visits t1
INNER JOIN person t2 ON t2.id = t1.person_id
INNER JOIN pizzeria t3 ON t3.id = t1.pizzeria_id
WHERE t2.name = 'Andrey'
EXCEPT
SELECT t4.name
FROM person_order t1
INNER JOIN person t2 ON t2.id = t1.person_id
INNER JOIN menu t3 ON t3.id = t1.menu_id
INNER JOIN pizzeria t4 ON t4.id = t3.pizzeria_id
WHERE t2.name = 'Andrey';