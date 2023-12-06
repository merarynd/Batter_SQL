-- Сессиия 1 (Левый терминал)устанавливаем уровень изоляции
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Сессиия 2 (Правый терминал)устанавливаем уровень изоляции
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Сессиия 1 (Левый терминал)
BEGIN;

-- Сессиия 2 (Правый терминал)
BEGIN;

-- Сессиия 1 (Левый терминал)
SELECT SUM(rating) FROM pizzeria;

-- Сессиия 2 (Правый терминал)
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
COMMIT;

-- Сессиия 1 (Левый терминал)
SELECT SUM(rating) FROM pizzeria;
COMMIT;

-- Сессиия 1 (Левый терминал)
SELECT SUM(rating) FROM pizzeria;

-- Сессиия 2 (Правый терминал)
SELECT SUM(rating) FROM pizzeria;