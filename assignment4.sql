
UPDATE employees 
SET salary = salary * 1.10
WHERE dept_id = 2;


DELETE FROM employees 
WHERE dept_id = 3;


CREATE VIEW high_earners AS
SELECT * FROM employees WHERE
salary > 100000;

ALTER TABLE employees ADD 
CONSTRAINT chk_salary_positive 
CHECK (salary > 0);


CREATE INDEX idx_employee_last_name 
ON employees(last_name);


CREATE OR REPLACE PROCEDURE 
get_dept_employees(d_id INT)
LANGUAGE plpgsql AS $$
BEGIN 
    SELECT first_name, last_name
	FROM employees
	WHERE dept_id = d_id;
END $$; 