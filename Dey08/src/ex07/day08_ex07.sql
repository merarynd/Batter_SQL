-- Сессиия 1 (Левый терминал)
BEGIN;

-- Сессиия 2 (Правый терминал)
BEGIN;

-- Сессиия 1 (Левый терминал)
UPDATE pizzeria SET rating = 2 WHERE id =1;

-- Сессиия 2 (Правый терминал)
UPDATE pizzeria SET rating = 3 WHERE id =2;

-- Сессиия 1 (Левый терминал)
UPDATE pizzeria SET rating = 1 WHERE id =2;

-- Сессиия 2 (Правый терминал)
UPDATE pizzeria SET rating = 5 WHERE id =1;

-- Сессиия 1 (Левый терминал)
COMMIT;

-- Сессиия 2 (Правый терминал)
COMMIT;