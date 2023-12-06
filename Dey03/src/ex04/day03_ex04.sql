(SELECT t4.name AS pizzeria_name
FROM person t1
INNER JOIN  person_order t2 ON t1.id = t2.person_id
INNER JOIN  menu t3 ON t3.id = t2.menu_id
INNER JOIN  pizzeria t4 ON t4.id = t3.pizzeria_id
WHERE t1.gender = 'female'
EXCEPT
SELECT t4.name
FROM person t1
INNER JOIN  person_order t2 ON t1.id = t2.person_id
INNER JOIN  menu t3 ON t3.id = t2.menu_id
INNER JOIN  pizzeria t4 ON t4.id = t3.pizzeria_id
WHERE t1.gender = 'male')
UNION
(SELECT t4.name
FROM person t1
INNER JOIN  person_order t2 ON t1.id = t2.person_id
INNER JOIN  menu t3 ON t3.id = t2.menu_id
INNER JOIN  pizzeria t4 ON t4.id = t3.pizzeria_id
WHERE t1.gender = 'male'
EXCEPT
SELECT t4.name
FROM person t1
INNER JOIN  person_order t2 ON t1.id = t2.person_id
INNER JOIN  menu t3 ON t3.id = t2.menu_id
INNER JOIN  pizzeria t4 ON t4.id = t3.pizzeria_id
WHERE t1.gender = 'female')
order by pizzeria_name;