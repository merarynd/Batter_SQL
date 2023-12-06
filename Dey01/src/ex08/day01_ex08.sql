SELECT
       t1.order_date, CONCAT(name,' (age:', t2.age, ')')
           AS person_information FROM person_order t1
NATURAL JOIN
            (SELECT t2.id AS person_id, name, age FROM person t2 ) AS t2
ORDER BY t1.order_date, person_information;