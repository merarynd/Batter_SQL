--Создание функции со значениями по умолчанию
CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson VARCHAR DEFAULT 'Dmitriy',
    IN pprice INT DEFAULT 500,
    IN pdate DATE DEFAULT '2022-01-08'
)
RETURNS TABLE (name VARCHAR) AS
$$
BEGIN
    RETURN QUERY
    SELECT t2.name
    FROM menu t1
    INNER JOIN pizzeria t2 ON t2.id = t1.pizzeria_id
    INNER JOIN person_visits t3 ON t3.id = t1.pizzeria_id
    INNER JOIN person t4 ON t4.id = t3. person_id
    WHERE price < pprice AND t4.name = pperson AND visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

-- Проверяем функции
SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');

-- DROP FUNCTION fnc_person_visits_and_eats_on_date();