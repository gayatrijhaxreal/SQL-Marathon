
SELECT e.first_name AS Employee, m.first_name AS Manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;


SELECT first_name, salary FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);


SELECT e.first_name, d.dept_name, c.name AS company_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN companies c ON d.company_id = c.company_id;


SELECT salary FROM employees ORDER BY salary DESC LIMIT 1 OFFSET 1;


SELECT first_name, dept_id, salary,
RANK() OVER(PARTITION BY dept_id ORDER BY salary DESC) as salary_rank
FROM employees;


SELECT first_name, salary,
CASE 
    WHEN salary > 100000 THEN 'High'
    WHEN salary BETWEEN 70000 AND 100000 THEN 'Medium'
    ELSE 'Low'
END AS earnings_bracket
FROM employees;