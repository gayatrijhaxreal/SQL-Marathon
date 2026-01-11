
BEGIN;
UPDATE employees SET salary = salary - 5000 WHERE first_name = 'Bob';
UPDATE employees SET salary = salary + 5000 WHERE first_name = 'Charlie';
COMMIT;


WITH RECURSIVE org_chart AS (
    SELECT emp_id, first_name, manager_id, 1 as level
    FROM employees WHERE manager_id IS NULL
    UNION ALL
    SELECT e.emp_id, e.first_name, e.manager_id, oc.level + 1
    FROM employees e
    JOIN org_chart oc ON e.manager_id = oc.emp_id
)
SELECT * FROM org_chart;

SELECT first_name, salary,
LAG(salary) OVER (ORDER BY salary) as previous_salary
FROM employees;