DROP DATABASE IF EXISTS employee_db;
CREATE DATABASE employee_db;

USE employee_db;

CREATE TABLE department (
  dept_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE role (
  role_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  dept_id INT,
  title VARCHAR(30) NOT NULL,
  salary DECIMAL NOT NULL,
  FOREIGN KEY (dept_id)
  REFERENCES department(dept_id)
  ON DELETE SET NULL
);

CREATE TABLE employee (
  employee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  role_id INT,
  manager_id INT,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  FOREIGN KEY (role_id)
  REFERENCES role(role_id)
  ON DELETE SET NULL,
  FOREIGN KEY (manager_id)
  REFERENCES employee(employee_id)
  ON DELETE SET NULL
);

