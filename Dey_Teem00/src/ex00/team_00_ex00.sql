CREATE TABLE node_names (
  point1 VARCHAR,
  point2 VARCHAR,
  cost NUMERIC
);

INSERT INTO node_names (point1, point2, cost) VALUES
('a','b',10),
('b','a',10),
('c','a',15),
('a','c',15),
('a','d',20),
('d','a',20),
('b','d',25),
('d','b',25),
('c','d',30),
('d','c',30),
('b','c',35),
('c','b',35);


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
  (cost - total_costs[5]) = (
	  SELECT MIN(cost - total_costs[5]) 
	  FROM tabl
	  WHERE array_length(path, 1) = 5 AND
	  path[5]='a'
  )
ORDER BY 1, 2;