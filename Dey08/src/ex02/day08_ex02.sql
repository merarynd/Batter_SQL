-- Сессиия 1 (Левый терминал)устанавливаем уровень изоляции
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Сессиия 2 (Правый терминал)устанавливаем уровень изоляции
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Сессиия 1 (Левый терминал)
BEGIN;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Сессиия 2 (Правый терминал)
BEGIN;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Сессиия 1 (Левый терминал)
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- Сессиия 2 (Правый терминал)
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

-- Сессиия 1 (Левый терминал)
COMMIT;

-- Сессиия 2 (Правый терминал)
COMMIT;

-- Сессиия 1 (Левый терминал)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Сессиия 2 (Правый терминал)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';