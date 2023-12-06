-- Сессиия 1 (Левый терминал)
BEGIN; -- Начало транзакции
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut'; -- Проверили, что запись появилась(на скриншоте, левый терминал)
-- Сессиия 2 (Правый терминал)
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut'; -- Проверили, что записи нет(на скриншоте, правый экран)

-- Сессиия 1 (Левый терминал)
COMMIT; -- Фиксация транзакции сессии 1 и сохранение изменений

-- Сессиия 2 (Правый терминал)
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut'; -- Проверка, что изменения из первой сессии сохранились.