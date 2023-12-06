INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
(SELECT MAX(id) FROM person_order) + gv AS id,
id AS person_id,
(SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
'2022-02-25' AS order_date
FROM person t1
INNER JOIN generate_series(1,(SELECT count(*) FROM person )) AS gv ON gv = t1.id;