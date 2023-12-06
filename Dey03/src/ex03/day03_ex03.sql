(SELECT t2.name AS pizzeria_name
FROM person_visits t1
INNER JOIN pizzeria t2 ON t2.id = t1.pizzeria_id
INNER JOIN person t3 ON t3.id = t1.person_id
WHERE gender = 'female'
EXCEPT ALL
SELECT t2.name
FROM person_visits t1
INNER JOIN pizzeria t2 ON t2.id = t1.pizzeria_id
INNER JOIN person t3 ON t3.id = t1.person_id
WHERE gender = 'male')
UNION ALL
(SELECT t2.name AS pizzeria_name
FROM person_visits t1
INNER JOIN pizzeria t2 ON t2.id = t1.pizzeria_id
INNER JOIN person t3 ON t3.id = t1.person_id
WHERE gender = 'male'
EXCEPT ALL
SELECT t2.name
FROM person_visits t1
INNER JOIN pizzeria t2 ON t2.id = t1.pizzeria_id
INNER JOIN person t3 ON t3.id = t1.person_id
WHERE gender = 'female')
ORDER BY pizzeria_name;