use employee_db;

DELETE FROM employee;

DELETE FROM role;

DELETE FROM department;

ALTER TABLE employee AUTO_INCREMENT = 1;
ALTER TABLE role AUTO_INCREMENT = 1;
ALTER TABLE employee AUTO_INCREMENT = 1;



INSERT INTO department(dept_name)
VALUES ("Administration"),
         ("Sales"),
         ("Marketing"),
         ("Engineering"),
         ("Finance"),
         ("Legal"),
         ("Human Resources"),
         ("Customer Service");

select * from department;

INSERT INTO role (dept_id, title, salary)  
VALUES ((SELECT dept_id from department
          WHERE dept_name = "Administration"), "President", 200000),
        ((SELECT dept_id from department
            WHERE dept_name = "Administration"), "Vice President", 150000),
        ((SELECT dept_id from department
            WHERE dept_name = "Administration"), "Director", 100000),
        ((SELECT dept_id from department
            WHERE dept_name = "Administration"), "Manager", 80000),
        ((SELECT dept_id from department
            WHERE dept_name = "Administration"), "Supervisor", 60000),
        ((SELECT dept_id from department
            WHERE dept_name = "Administration"), "Staff", 40000),
        ((SELECT dept_id from department
            WHERE dept_name = "Administration"), "Intern", 20000),
        ((SELECT dept_id from department
            WHERE dept_name = "Sales"), "Director", 100000),
        ((SELECT dept_id from department
            WHERE dept_name = "Sales"), "Manager", 80000),
        ((SELECT dept_id from department
            WHERE dept_name = "Sales"), "Supervisor", 60000),
        ((SELECT dept_id from department
            WHERE dept_name = "Sales"), "Staff", 40000),
        ((SELECT dept_id from department
            WHERE dept_name = "Sales"), "Intern", 20000),
        ((SELECT dept_id from department
            WHERE dept_name = "Marketing"), "Director", 100000),
        ((SELECT dept_id from department
            WHERE dept_name = "Marketing"), "Manager", 80000),
        ((SELECT dept_id from department
            WHERE dept_name = "Marketing"), "Supervisor", 60000),
        ((SELECT dept_id from department
            WHERE dept_name = "Marketing"), "Staff", 40000),
        ((SELECT dept_id from department
            WHERE dept_name = "Marketing"), "Intern", 20000),
        ((SELECT dept_id from department
            WHERE dept_name = "Engineering"), "Director", 150000),
        ((SELECT dept_id from department
            WHERE dept_name = "Engineering"), "Manager", 125000),
        ((SELECT dept_id from department
            WHERE dept_name = "Engineering"), "Supervisor", 100000),
        ((SELECT dept_id from department
            WHERE dept_name = "Engineering"), "Staff", 100000),
        ((SELECT dept_id from department
            WHERE dept_name = "Engineering"), "Intern", 60000),
        ((SELECT dept_id from department
            WHERE dept_name = "Finance"), "Director", 100000),
        ((SELECT dept_id from department
            WHERE dept_name = "Finance"), "Manager", 80000),
        ((SELECT dept_id from department
            WHERE dept_name = "Finance"), "Supervisor", 60000),
        ((SELECT dept_id from department
            WHERE dept_name = "Finance"), "Staff", 40000),
        ((SELECT dept_id from department
            WHERE dept_name = "Finance"), "Intern", 20000),
        ((SELECT dept_id from department
            WHERE dept_name = "Legal"), "Director", 100000),
        ((SELECT dept_id from department
            WHERE dept_name = "Legal"), "Manager", 80000),
        ((SELECT dept_id from department
            WHERE dept_name = "Legal"), "Supervisor", 60000),
        ((SELECT dept_id from department
            WHERE dept_name = "Legal"), "Staff", 40000),
        ((SELECT dept_id from department
            WHERE dept_name = "Legal"), "Intern", 20000),
        ((SELECT dept_id from department
            WHERE dept_name = "Human Resources"), "Director", 100000),
        ((SELECT dept_id from department
            WHERE dept_name = "Human Resources"), "Manager", 80000),
        ((SELECT dept_id from department
            WHERE dept_name = "Human Resources"), "Supervisor", 60000),
        ((SELECT dept_id from department
            WHERE dept_name = "Human Resources"), "Staff", 40000),
        ((SELECT dept_id from department
            WHERE dept_name = "Human Resources"), "Intern", 20000),
        ((SELECT dept_id from department
            WHERE dept_name = "Customer Service"), "Director", 100000),
        ((SELECT dept_id from department
            WHERE dept_name = "Customer Service"), "Manager", 80000),
        ((SELECT dept_id from department
            WHERE dept_name = "Customer Service"), "Supervisor", 60000),
        ((SELECT dept_id from department
            WHERE dept_name = "Customer Service"), "Staff", 40000),
        ((SELECT dept_id from department
            WHERE dept_name = "Customer Service"), "Intern", 20000);


select * from role;

INSERT INTO employee(role_id, manager_id, first_name, last_name)  
VALUES ((SELECT role_id from role
           JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Administration"
          WHERE title = "President"), NULL, "President", "Administration");

INSERT INTO employee(role_id, manager_id, first_name, last_name)  
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Administration"
            WHERE title = "Vice President"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Administration"
                  WHERE role.title = "President")),
          "Vice President", "Administration");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Administration"
            WHERE title = "Director"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Administration"
                  WHERE role.title = "Vice President")),
          "Director", "Administration");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Administration"
            WHERE title = "Manager"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Administration"
                  WHERE role.title = "Director")),
          "Manager", "Administration"); 

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Administration"
            WHERE title = "Supervisor"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Administration"
                  WHERE role.title = "Manager")),
          "Supervisor", "Administration");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Administration"
            WHERE title = "Staff"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Administration"
                  WHERE role.title = "Supervisor")),
          "Staff", "Administration");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Administration"
            WHERE title = "Intern"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Administration"
                  WHERE role.title = "Staff")),
          "Intern", "Administration");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Sales"
            WHERE title = "Director"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Administration"
                  WHERE role.title = "President")),
          "Director", "Sales");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Sales"
            WHERE title = "Manager"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Sales"
                  WHERE role.title = "Director")),
          "Manager", "Sales");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Sales"
            WHERE title = "Supervisor"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Sales"
                  WHERE role.title = "Manager")),
          "Supervisor", "Sales"); 
INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Sales"
            WHERE title = "Staff"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Sales"
                  WHERE role.title = "Supervisor")),
          "Staff", "Sales");  

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Sales"
            WHERE title = "Intern"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Sales"
                  WHERE role.title = "Staff")),
          "Intern", "Sales");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Marketing"
            WHERE title = "Director"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Administration"
                  WHERE role.title = "President")),
          "Director", "Marketing"); 

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Marketing"
            WHERE title = "Manager"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Marketing"
                  WHERE role.title = "Director")),
          "Manager", "Marketing");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Marketing"
            WHERE title = "Supervisor"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Marketing"
                  WHERE role.title = "Manager")),
          "Supervisor", "Marketing");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Marketing"
            WHERE title = "Staff"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Marketing"
                  WHERE role.title = "Supervisor")),
          "Staff", "Marketing");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Marketing"
            WHERE title = "Intern"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Marketing"
                  WHERE role.title = "Staff")),
          "Intern", "Marketing"); 

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Engineering"
            WHERE title = "Director"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Administration"
                  WHERE role.title = "President")),
          "Director", "Engineering");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Engineering"
            WHERE title = "Manager"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Engineering"
                  WHERE role.title = "Director")),
          "Manager", "Engineering");  

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Engineering"
            WHERE title = "Supervisor"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Engineering"
                  WHERE role.title = "Manager")),
          "Supervisor", "Engineering");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Engineering"
            WHERE title = "Staff"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Engineering"
                  WHERE role.title = "Supervisor")),
          "Staff", "Engineering");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Engineering"
            WHERE title = "Intern"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Engineering"
                  WHERE role.title = "Staff")),
          "Intern", "Engineering");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Finance"
            WHERE title = "Director"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Administration"
                  WHERE role.title = "Vice President")),
          "Director", "Finance");
INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Finance"
            WHERE title = "Manager"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Finance"
                  WHERE role.title = "Director")),
          "Manager", "Finance");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Finance"
            WHERE title = "Supervisor"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Finance"
                  WHERE role.title = "Manager")),
          "Supervisor", "Finance");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Finance"
            WHERE title = "Staff"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Finance"
                  WHERE role.title = "Supervisor")),
          "Staff", "Finance");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Finance"
            WHERE title = "Intern"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Finance"
                  WHERE role.title = "Staff")),
          "Intern", "Finance");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Legal"
            WHERE title = "Director"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Administration"
                  WHERE role.title = "President")),
          "Director", "Legal");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Legal"
            WHERE title = "Manager"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Legal"
                  WHERE role.title = "Director")),
          "Manager", "Legal");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Legal"
            WHERE title = "Supervisor"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Legal"
                  WHERE role.title = "Manager")),
          "Supervisor", "Legal");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Legal"
            WHERE title = "Staff"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Legal"
                  WHERE role.title = "Supervisor")),
          "Staff", "Legal");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Legal"
            WHERE title = "Intern"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Legal"
                  WHERE role.title = "Staff")),
          "Intern", "Legal");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Human Resources"
            WHERE title = "Director"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Administration"
                  WHERE role.title = "Vice President")),
          "Director", "Human Resources");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Human Resources"
            WHERE title = "Manager"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Human Resources"
                  WHERE role.title = "Director")),
          "Manager", "Human Resources");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Human Resources"
            WHERE title = "Supervisor"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Human Resources"
                  WHERE role.title = "Manager")),
          "Supervisor", "Human Resources");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Human Resources"
            WHERE title = "Staff"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Human Resources"
                  WHERE role.title = "Supervisor")),
          "Staff", "Human Resources");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Human Resources"
            WHERE title = "Intern"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Human Resources"
                  WHERE role.title = "Staff")),
          "Intern", "Human Resources");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Customer Service"
            WHERE title = "Director"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Administration"
                  WHERE role.title = "Vice President")),
          "Director", "Customer Service");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Customer Service"
            WHERE title = "Manager"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Customer Service"
                  WHERE role.title = "Director")),
          "Manager", "Customer Service");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Customer Service"
            WHERE title = "Supervisor"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Customer Service"
                  WHERE role.title = "Manager")),
          "Supervisor", "Customer Service");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Customer Service"
            WHERE title = "Staff"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Customer Service"
                  WHERE role.title = "Supervisor")),
          "Staff", "Customer Service");

INSERT INTO employee(role_id, manager_id, first_name, last_name)
VALUES  ((SELECT role_id from role
            JOIN department ON department.dept_id = role.dept_id
            AND department.dept_name = "Customer Service"
            WHERE title = "Intern"), 
         (SELECT e2.employee_id from employee e2
          WHERE role_id = 
                (SELECT role_id 
                   FROM role 
                    JOIN department 
                      ON department.dept_id = role.dept_id
                     AND department.dept_name = "Customer Service"
                  WHERE role.title = "Staff")),
          "Intern", "Customer Service");

SELECT employee.*, e2.first_name, e2.last_name 
  FROM employee 
  LEFT JOIN employee e2
    ON e2.employee_id = employee.manager_id;

