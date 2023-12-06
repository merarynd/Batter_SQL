WITH RECURSIVE tabl AS (
  SELECT
    point1,
    point2,
    cost,
    ARRAY[point1] AS path,
    FALSE AS cycle,
    ARRAY[cost] AS total_costs
  FROM
    node_names
  WHERE
    point1 = 'a'

  UNION ALL

  SELECT
    node_names.point1,
    node_names.point2,
    node_names.cost + tabl.cost,
    tabl.path || node_names.point1 AS path,
    node_names.point1 = ANY(tabl.path) AS cycle,
    tabl.total_costs || node_names.cost AS total_costs
  FROM
    node_names
  INNER JOIN
    tabl ON tabl.point2 = node_names.point1 AND NOT cycle
)

SELECT
  DISTINCT (cost - total_costs[5]) AS total_cost,
  path AS tour
FROM
  tabl
WHERE
  array_length(path, 1) = 5 AND path[5]='a'
ORDER BY 1, 2;