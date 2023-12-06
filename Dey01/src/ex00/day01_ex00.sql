SELECT id AS object_id, person.name AS object_name
FROM person
UNION ALL
SELECT menu.id AS object_id, menu.pizza_name AS object_name
FROM menu
ORDER BY object_id, object_name;