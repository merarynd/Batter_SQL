SELECT DISTINCT t2.name
FROM person_order t1
INNER JOIN person t2 ON t2.id = t1.person_id
ORDER BY name;