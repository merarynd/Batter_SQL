--Создаем триггерную функцию:
CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
RETURNS TRIGGER AS $trg_person_delete_audit$
BEGIN
    INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
    VALUES (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'D', OLD.*);
    RETURN NULL;
END;
$trg_person_delete_audit$ LANGUAGE plpgsql;

-- Создание триггера:
CREATE TRIGGER trg_person_delete_audit
AFTER DELETE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_delete_audit();

-- Удаляем значения, чтобы проверить, что триггер и функция сработали:
DELETE FROM person WHERE id = 10;

-- Проверяем что появилась запись в новой таблице:
SELECT * FROM person_audit;