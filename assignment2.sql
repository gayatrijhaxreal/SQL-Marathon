
SELECT * FROM employees;


SELECT * FROM employees WHERE dept_id = 1;


SELECT DISTINCT job_title FROM employees;


SELECT * FROM employees ORDER BY salary DESC;
SELECT COUNT(*) AS total_staff FROM employees;

SELECT dept_id, AVG(salary) FROM employees GROUP BY dept_id;

SELECT e.first_name, e.last_name, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;
