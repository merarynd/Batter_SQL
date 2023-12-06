-- Создаем функцию со значениями Фибоначи
CREATE OR replace FUNCTION fnc_fibonacci(IN pstop integer DEFAULT 10)
RETURNS SETOF INTEGER AS
$$
WITH RECURSIVE table_fib(a, b) AS
    (SELECT 0, 1
    UNION ALL
    SELECT b, a + b
    FROM table_fib
    WHERE b < pstop)
    SELECT a
    FROM table_fib;
$$ LANGUAGE SQL;

--Проверяем функции
select * from fnc_fibonacci(100);
select * from fnc_fibonacci();