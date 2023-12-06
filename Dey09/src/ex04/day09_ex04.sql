-- функция для получения лиц женского пола
CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS TABLE ( id bigint, name varchar, age integer, gender varchar, address varchar) AS
$$
    SELECT * FROM person
    WHERE gender = 'female';
$$  LANGUAGE SQL;

-- функция для получения лиц мужского пола
CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS TABLE ( id bigint, name varchar, age integer, gender varchar, address varchar) AS
$$
    SELECT * FROM person
    WHERE gender = 'male';
$$  LANGUAGE SQL;


--Проверяем функций
SELECT * FROM fnc_persons_male();
SELECT * FROM fnc_persons_female();