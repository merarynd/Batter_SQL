WITH last_date AS (
         SELECT DISTINCT name, MAX(updated) AS max_updated, id
         FROM currency
         GROUP BY id, name),
     summary AS (
         SELECT user_id, SUM(money) AS volume, type, currency_id
         FROM balance
         GROUP BY user_id, type, currency_id)

SELECT DISTINCT COALESCE(u.name, 'not defined') AS name,
                COALESCE(u.lastname, 'not defined') AS lastname,
                s.type,
                s.volume,
                COALESCE(ld.name, 'not defined') AS currency_name,
                COALESCE(ld.rate_to_usd, 1) AS last_rate_to_usd,
                s.volume * COALESCE(ld.rate_to_usd, 1) AS total_volume_in_usd
FROM "user" u
FULL JOIN summary s ON s.user_id = u.id
LEFT JOIN (
    SELECT ld.name, ld.id, c.rate_to_usd
    FROM last_date ld
    LEFT JOIN currency c ON ld.id = c.id AND ld.max_updated = c.updated
) ld ON s.currency_id = ld.id
ORDER BY name DESC, lastname, type;

