COMMENT ON TABLE person_discounts IS 'В этой таблице хранится информация о персональных скидках.';

COMMENT ON COLUMN person_discounts.id IS 'В данном столбце ранятс id персональных скидок.';
COMMENT ON COLUMN person_discounts.person_id IS 'В данном столбце хванятся id людей.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'В данном столбце хранятся id пиццерий.';
COMMENT ON COLUMN person_discounts.discount IS 'В данном столбце хранятся значения скидки в процентах.';