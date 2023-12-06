--Удаляем старые раннее созданные функции.
DROP FUNCTION fnc_persons_male();
DROP FUNCTION fnc_persons_female();

-- Создание общей функции
CREATE OR REPLACE FUNCTION fnc_persons(IN pgender VARCHAR DEFAULT 'female')
RETURNS TABLE (id bigint, name varchar, age integer, gender varchar, address varchar) AS
$$
    SELECT * FROM person
    WHERE gender = pgender;
$$ LANGUAGE SQL;


-- Проверяем функции
SELECT * FROM fnc_persons(pgender := 'male');
SELECT * FROM fnc_persons();