--Создаем триггерную функцию:
CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit()
RETURNS TRIGGER AS $trg_person_update_audit$
BEGIN
    INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
    VALUES (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'U', OLD.*);
    RETURN NULL;
END;
$trg_person_update_audit$ LANGUAGE plpgsql;

-- Создание триггера:
CREATE TRIGGER trg_person_update_audit
AFTER UPDATE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_update_audit();

-- Вставляем значения, чтобы проверить, что триггер и функция сработали:
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

-- Проверяем что появилась запись в новой таблице:
SELECT * FROM person_audit;