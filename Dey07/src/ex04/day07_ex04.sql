SELECT t2.name, COUNT(*) AS count_of_visits
FROM person_visits t1
JOIN person t2 ON t2.id = t1.person_id
GROUP BY t2.name
HAVING COUNT(*) > 3;