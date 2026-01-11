
CREATE TABLE companies (
    company_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    company_id INT REFERENCES companies(company_id) ON DELETE CASCADE
);

CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    job_title VARCHAR(50),
    salary NUMERIC(10, 2) CHECK (salary > 0),
    manager_id INT REFERENCES employees(emp_id),
    dept_id INT REFERENCES departments(dept_id)
);


INSERT INTO companies (name, location) VALUES ('TechNova Solutions', 'San Francisco');

INSERT INTO departments (dept_name, company_id) 
VALUES ('Engineering', 1), ('Marketing', 1), ('HR', 1);

INSERT INTO employees (first_name, last_name, job_title, salary, manager_id, dept_id)
VALUES 
('Alice', 'Johnson', 'CTO', 150000, NULL, 1),
('Bob', 'Smith', 'Lead Developer', 120000, 1, 1),
('Charlie', 'Davis', 'Junior Developer', 70000, 2, 1),
('Diana', 'Prince', 'Marketing Manager', 95000, 1, 2),
('Edward', 'Norton', 'HR Specialist', 60000, 1, 3);

