INSERT INTO  person_visits (id, person_id, pizzeria_id, visit_date)
VALUES
    ((SELECT max(id)+1 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Dmitriy'),
    (SELECT pizzeria.id FROM pizzeria
    INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
    WHERE price < 800 AND NOT menu.pizza_name = 'Papa Johns' ORDER BY pizzeria.id LIMIT 1), '2022-01-08');

--  DELETE FROM person_visits WHERE id = 22;