WITH tabl AS(SELECT address , ROUND(MAX(age) - MIN(age) / MAX(age::numeric), 2) AS formula,
       ROUND (AVG(age), 2) AS average
FROM person
GROUP BY address)

SELECT *, CASE WHEN formula > average THEN TRUE
          ELSE FALSE END AS comparison
FROM tabl
ORDER BY 1;