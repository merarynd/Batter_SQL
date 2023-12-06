SELECT name FROM pizzeria t1
WHERE t1.id
NOT IN (SELECT t2.pizzeria_id FROM person_visits t2);

SELECT name FROM pizzeria t1
WHERE NOT EXISTS
    (SELECT t2.pizzeria_id FROM person_visits t2 WHERE t2.pizzeria_id = t1.id);