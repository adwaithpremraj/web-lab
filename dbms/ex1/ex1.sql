drop database company;


CREATE DATABASE company;
use company;


CREATE TABLE jobs(job_id int NOT NULL PRIMARY KEY, job_title VARCHAR(50),
min_salary INT, max_salary INT);


CREATE TABLE regions(region_id INT NOT NULL PRIMARY KEY, region_name VARCHAR(50));


CREATE TABLE countries(country_id VARCHAR(50) NOT NULL PRIMARY KEY, country_name VARCHAR(20), region_id INT NOT NULL,
FOREIGN KEY (region_id) REFERENCES regions(region_id));

CREATE TABLE locations(location_id int NOT NULL PRIMARY KEY, street_address VARCHAR(50),
postal_code VARCHAR(10), city VARCHAR(50), state_province VARCHAR(20),country_id VARCHAR(50) NOT NULL,
FOREIGN KEY(country_id) REFERENCES countries(country_id));

CREATE TABLE departments(department_id INT PRIMARY KEY, department_name VARCHAR(50),
location_id INT, foreign key departments(location_id)references locations(location_id));



CREATE TABLE employees(employee_id INT PRIMARY KEY, first_name VARCHAR(50),last_name VARCHAR(50),
email VARCHAR(50), phone_number BIGINT, hire_date VARCHAR(50), job_id INT(11) NOT NULL, salary INT, manager_id INT,
department_id INT, FOREIGN KEY (manager_id) REFERENCES employees(employee_id),
FOREIGN KEY (job_id) REFERENCES jobs(job_id),
FOREIGN KEY (department_id) REFERENCES departments(department_id));
-- 


CREATE TABLE dependents(dependent_id INT PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50),
relationship VARCHAR(50), employee_id INT, FOREIGN KEY dependents(employee_id) REFERENCES employees(employee_id));




