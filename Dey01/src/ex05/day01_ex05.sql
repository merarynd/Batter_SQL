SELECT * FROM person
INNER JOIN pizzeria ON person.id >= pizzeria.id OR person.id <= pizzeria.id
ORDER BY person.id, pizzeria.id;