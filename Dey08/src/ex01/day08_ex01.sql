-- Выполнил команду SHOW TRANSACTION ISOLATION LEVEL, убедился что я нахожусь на уровне изоляции по умолчанию в своей базе данных.
-- Результат «read commit»;
-- Сессия 1 (Левый терминал)
BEGIN;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Сессиия 2 (Правый терминал)
BEGIN;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Сессия 1 (Левый терминал)
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- Сессия 2 (Правый терминал)
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- ждёт

-- Сессия 1 (Левый терминал)
COMMIT;
-- Сессия 2 обновилась. Получила значение 4.

-- Сессия 2 (Правый терминал)
COMMIT;
-- Сессия 1 получил значение 3.6

-- Сессия 1 (Левый терминал)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Сессия 2 (Правый терминал)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
