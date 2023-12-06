insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT
    COALESCE(u.name, 'not defined') as name,
    COALESCE(u.lastname, 'not defined') as lastname,
    c.name as currency_name,
    (money * rate_to_usd) as currency_un_usd
FROM
    balance b
LEFT JOIN
    "user" u ON b.user_id = u.id
JOIN
    currency c ON b.currency_id = c.id
WHERE c.updated = (
    SELECT CASE
        WHEN b.updated < (SELECT MIN(updated) FROM currency WHERE id = b.currency_id) THEN
            (SELECT MIN(updated) FROM currency WHERE id = b.currency_id AND b.updated < updated)
        ELSE
            (SELECT MAX(updated) FROM currency WHERE id = b.currency_id AND b.updated > updated)
        END
    )
ORDER BY
    name desc,
    lastname,
    currency_name;