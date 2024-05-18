UPDATE employees
SET SALARY = salary + 100
WHERE job_title = 'Manager'
;

SELECT * FROM employees
WHERE job_title = 'Manager'
;