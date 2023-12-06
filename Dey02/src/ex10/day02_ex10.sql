SELECT t1.name AS person_name1, t2.name AS person_name2, t1.address AS common_address
FROM person t1
JOIN person t2 ON t1.address = t2.address AND t1.name < t2.name -- NOT t1.name = t2.name
ORDER BY person_name1, person_name2;