-- Создаем таблицу:
CREATE TABLE person_audit (
  created timestamp with time zone DEFAULT current_timestamp NOT NULL,
  type_event char(1) DEFAULT 'I' NOT NULL CONSTRAINT ch_type_event CHECK ( type_event IN ('I', 'D', 'U')),
  row_id bigint NOT NULL,
  name	varchar,
  age	integer,
  gender	varchar,
  address	varchar
);

--Создаем триггерную функцию:
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $trg_person_insert_audit$
BEGIN
    INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
    VALUES (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'I', NEW.*);
    RETURN NEW;
END;
$trg_person_insert_audit$ LANGUAGE plpgsql;

-- Создание триггера:
CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

-- Вставляем значения, чтобы проверить, что триггер и функция сработали:
INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

-- Проверяем что появилась запись в новой таблице:
SELECT * FROM person_audit;

--DELETE FROM person where address = 'Irkutsk';