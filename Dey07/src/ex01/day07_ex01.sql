SELECT t2.name, count(*) AS count_of_visits
FROM person_visits t1
INNER JOIN person t2 ON t2.id = t1.person_id
GROUP BY t2.name
ORDER BY count_of_visits DESC
LIMIT 4;