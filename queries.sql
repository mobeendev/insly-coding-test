
Find employee work experience

SELECT DISTINCT
  *
FROM
    inslydb.employee emp
        INNER JOIN
    work_experience we ON we.employee_id = emp.id
WHERE
    emp.id = 1



Find employee education in all languages


SELECT DISTINCT
    *
FROM
    inslydb.employee emp
        INNER JOIN
    education edu ON edu.employee_id = emp.id
WHERE
    emp.id = 1



Combined Query 

SELECT DISTINCT
    *
FROM
    inslydb.employee emp
        INNER JOIN
    education edu ON edu.employee_id = emp.id
        INNER JOIN
    work_experience we ON we.employee_id = emp.id
WHERE
    emp.id = 1

