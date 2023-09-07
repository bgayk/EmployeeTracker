inquirer = require("inquirer");
prompts = require("./assets/js/prompts.js");
// Import and require mysql2
const mysql = require('mysql2');

// Connect to database
const db = mysql.createConnection(
    {
      host: 'localhost',
      // MySQL username,
      user: 'root',
      password: 'example',
      database: 'employee_db'
    },
    console.log(`Connected to the employees_db database.`)
  );
  
// addDepartment will add a department to the database
const addDepartment = async () => {
    // Prompt for department name
    /*
    const response = await inquirer.prompt(prompts.fetchAddDepartmentQuestions());
    
    console.log(response);

    if (response.deptName === null || response.deptName === undefined) {
        console.log(`No department name entered.  Returning to main menu.`);
        return;
    }
    */

    // Query the database for all departments to avoid duplicates
    const sql = `SELECT dept_name FROM department WHERE dept_name = ?;`;
    const params = ['Sales'];

    let depts = [];
    db.query(sql, params, (err, rows) => {
            if (err) {
            console.log(`Error: ${err.message}`);
            return;
            }
            for(let i = 0; i < rows.length; i++) {            
               depts.push(rows[i].dept_name);
            }
            console.log(`\n\nDepartment: ${depts[0]} already exists.  Returning to main menu.  Please try again.`);
            return;     
            });
}

const viewDepartments = async () => 
{
    const sql = `SELECT dept_name Department, dept_id DepartmentID FROM department;`;
    db.query(sql, (err, rows) => {
        if (err) {
            console.log(`Error: ${err.message}`);
            return;
        }

        console.table(rows, ['Department', 'DepartmentID']);
    });
}

const viewRoles = async () => 
{
    const sql = `SELECT department.dept_name Department, role.title Role, role.role_id RoleID, role.salary Salary ` + 
                ` FROM role ` +
                ` LEFT JOIN department ON department.dept_id = role.dept_id ` +
                ` ORDER BY department.dept_name, role.salary DESC;`;
    
    db.query(sql, (err, rows) => {
        if (err) {
            console.log(`Error: ${err.message}`);
            return;
        }

        console.table(rows, ['Role', 'RoleID', 'Department', 'Salary']);

    });
}

const viewEmployees = async () =>
{
    const sql = `SELECT department.dept_name Department, role.title Role, role.salary Salary ` + 
                ` FROM employee ` +
                ` JOIN role ON department.dept_id = role.dept_id ` +
                ` ORDER BY department.dept_name, role.salary DESC;`;
    
    db.query(sql, (err, rows) => {
        if (err) {
            console.log(`Error: ${err.message}`);
            return;
        }

        console.table(rows, ['Department', 'Role', 'Salary']);

    });    
}

const main = async () => {
    let mainMenuAction = ``;

    do {
        console.clear();
        mainMenuAction = await inquirer.prompt(prompts.fetchMainMenuQuestions());
        // console.log(mainMenuAction);
        switch(mainMenuAction.mainMenuSelection) {
            case `Add Department`:
                addDepartment();
                break;
            case `View Departments`:
                viewDepartments();
                break;
            case `View Roles`:
                viewRoles();
                break;
        };    
        if (mainMenuAction.mainMenuSelection === `Exit`) {  
            console.log(`Exiting application.`);
            // await inquirer.prompt(prompts.fetchContinueQuestions());
            break;
        }
    } while (mainMenuAction.mainMenuSelection !== `Exit`);

    process.exit(0);
}

main();

