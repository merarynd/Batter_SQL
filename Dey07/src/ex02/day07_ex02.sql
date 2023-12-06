WITH tabl AS ((
    SELECT t2.name AS name, count(*) AS count ,'visit' AS action_type
    FROM person_visits t1
    INNER JOIN pizzeria t2 ON t2.id = t1.pizzeria_id
    GROUP BY name
    ORDER BY count DESC
    LIMIT 3)
     UNION
    (SELECT t2.name AS name, count(*) AS count ,'order' AS action_type
    FROM person_order t1
    INNER JOIN menu t3 ON t3.id = t1.menu_id
    INNER JOIN pizzeria t2 ON t2.id = t3.pizzeria_id
    GROUP BY name
    ORDER BY count DESC
        LIMIT 3)
)
SELECT *
FROM tabl
ORDER BY
    action_type ASC,
    count DESC;