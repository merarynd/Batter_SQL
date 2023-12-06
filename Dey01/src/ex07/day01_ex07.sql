SELECT
       t1.order_date, CONCAT(name,' (age:', t2.age, ')')
           AS person_information FROM person_order t1
INNER JOIN person t2 on t2.id = t1.person_id
ORDER BY t1.order_date, person_information;