SELECT t1.object_name
FROM (
  SELECT pizza_name AS object_name, 'menu' AS new_stolb
  FROM menu
  UNION ALL
  SELECT name, 'person' AS new_stolb
  FROM person
) AS t1
ORDER BY t1.new_stolb DESC, t1.object_name;