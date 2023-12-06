-- Удаляем раннее созданные тригеры
DROP TRIGGER trg_person_delete_audit ON person;
DROP TRIGGER trg_person_update_audit ON person;
DROP TRIGGER trg_person_insert_audit ON person;

-- Удаляем раннее созданные триггерные функции
DROP FUNCTION fnc_trg_person_delete_audit();
DROP FUNCTION fnc_trg_person_update_audit();
DROP FUNCTION fnc_trg_person_insert_audit();

-- Удаляем все ранее занесенные триггерными функциями строки
TRUNCATE person_audit;

--Создаем общую триггерную функцию:
CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
RETURNS TRIGGER AS $trg_person_audit$
BEGIN
    iF (TG_OP = 'DELETE') THEN
            INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
            VALUES (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'D', OLD.*);
    ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
            VALUES (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'U', OLD.*);
    ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
            VALUES (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'I', NEW.*);
    END IF;
    RETURN NULL;
END;
$trg_person_audit$ LANGUAGE plpgsql;

-- Создание триггера:
CREATE TRIGGER trg_person_audit
AFTER INSERT OR UPDATE OR DELETE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();

-- Вставляем значения, чтобы проверить, что триггер и функция сработали:
INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

-- Удаляем значения, чтобы проверить, что триггер и функция сработали:
DELETE FROM person WHERE id = 10;

-- Проверяем что появилась запись в новой таблице:
SELECT * FROM person_audit;

-- DROP TRIGGER trg_person_audit ON person;
-- DROP FUNCTION fnc_trg_person_audit();