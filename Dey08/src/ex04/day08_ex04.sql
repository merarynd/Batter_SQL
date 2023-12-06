-- Сессиия 1 (Левый терминал)устанавливаем уровень изоляции
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Сессиия 2 (Правый терминал)устанавливаем уровень изоляции
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Сессиия 1 (Левый терминал)
BEGIN;

-- Сессиия 2 (Правый терминал)
BEGIN;

-- Сессиия 1 (Левый терминал)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Сессиия 2 (Правый терминал)
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;

-- Сессиия 1 (Левый терминал)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;

-- Сессиия 1 (Левый терминал)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Сессиия 2 (Правый терминал)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';