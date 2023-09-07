const inquirer = require("inquirer");
// const { default: inquirer } = inquirer;

prompts = require("./assets/js/prompts.js");

// Import and require mysql2
const mysql = require('mysql2/promise');
const { async } = require("rxjs");

// Connect to database
const dbConfig = 
    {
      host: 'localhost',
      // MySQL username,
      user: 'root',
      password: 'example',
      database: 'employee_db'
    };

let db;

    

// addDepartment will add a department to the database
async function addDepartment() {
    const inq2 = require("inquirer");

    // Prompt for department name
    let userChoice = '';            if (response.deptName === null || response.deptName === undefined) {
    console.clear();

    console.log(`\n\nExisting Departments \n\n`);
    
    // viewDepartments();

    console.log(`Add Department \n\n`);
    let departmentToAdd = '';
    userChoice = await inq2.prompt(prompts.fetchAddDepartmentQuestions())
        .then((response) => {
            if (response.deptName === null || response.deptName === undefined) {
                console.log(`No department name entered.  Returning to main menu.`);
                return true;
            } else
            {
                departmentToAdd = response.deptName;
            };
        })
        .catch((err) => {
            if (err.isTtyError) {
              console.log(`Prompt couldn't be rendered in the current environment`);
            } else {
                console.log(`Error: ${err.message}`);
            }
            return false;
        });

        // Add Deparmtnet to database
        if (departmentToAdd !== '') {
            // Query the database for all departments to avoid duplicates
            const sql = `SELECT dept_name FROM department WHERE dept_name = ?;`;
            const params = [departmentToAdd];
            let result = [];
            try 
            {        
                result = await db.query(sql, params);
            } catch(err) 
            {
                console.log(`\n\nDB addDepartment Error: ${err.message}`);
                return false;
            } 
            if (result[0].length > 0) {
                console.log(`\n\nDepartment: ${departmentToAdd} already exists.  Returning to main menu.`);
                return true;
            }

            // Add department to database
            
        }



}

async function viewDepartments() 
{
    const sql = `SELECT dept_name Department, dept_id DepartmentID FROM department;`;
    const params =[];

    let result = [];
    try {        
        result = await db.query(sql, params);
    } catch(err) {
        console.log(`DB viewDepartments Error: ${err.message}`);
        return false;
    } 

    let parsedResult = [];
    // Parsing the result set to remove RowDataPacket 
    // and leverage native JS arrays
    for (let i = 0; i < result[0].length; i++) {
        parsedResult.push(JSON.parse(JSON.stringify(result[0][i])));
    }

    console.log(`\n\n`);
    console.table(parsedResult, ['Department', 'DepartmentID']);

    return true;
}


async function viewRoles()  
{
    const sql = `SELECT department.dept_name Department, role.title Role, role.role_id RoleID, role.salary Salary ` + 
                ` FROM role ` +
                ` LEFT JOIN department ON department.dept_id = role.dept_id ` +
                ` ORDER BY department.dept_name, role.salary DESC;`;
    const params =[];

    let result = [];
    try {        
        result = await db.query(sql, params);
    } catch(err) {
        console.log(`DB viewRoles Error: ${err.message}`);
        return false;
    } 

    let parsedResult = [];
    // Parsing the result set to remove RowDataPacket 
    // and leverage native JS arrays
    for (let i = 0; i < result[0].length; i++) {
        parsedResult.push(JSON.parse(JSON.stringify(result[0][i])));
    }

    console.log(`\n\n`);
    console.table(parsedResult, ['Role', 'RoleID', 'Department', 'Salary']);

    return true;
}

const viewEmployees = async () => 
{
    // Calling a view to get the employee details
    const sql = 'SELECT * FROM view_employee_detail;'
    const params =[];

    let result = [];
    try {        
        result = await db.query(sql, params);
    } catch(err) {
        console.log(`DB viewEmployees Error: ${err.message}`);
        return false;
    } 

    let parsedResult = [];
    // Parsing the result set to remove RowDataPacket 
    // and leverage native JS arrays
    for (let i = 0; i < result[0].length; i++) {
        parsedResult.push(JSON.parse(JSON.stringify(result[0][i])));
    }

    console.log(`\n\n`);
    console.table(parsedResult, ['EmployeeID', 'EmpFirstName', 'EmpLastName', 'JobTitle', 'Department', 'Salary', 'MgrFirstName', 'MgrLastName']);

    return true;
       
}

// const main = async () => 
async function main()
{
    // Connect to database
    db = await mysql.createConnection(dbConfig);

    let optionSuccess = true;
    let mmPrompt = '';

    do {
        console.clear();
        console.log(`\n\nMain Menu\n\n`);

        let mmPrompt = await inquirer.prompt(prompts.fetchMainMenuQuestions())
            .then(async (response) => {
                optionSuccess = false
                switch(response.mainMenuSelection) 
                {
                    case `Add Department`:   
                        // addDepartment();
                        optionSuccess = await addDepartment();
                        break;
                    case `View Departments`:
                        optionSuccess = await viewDepartments();
                        break;
                    case `View Roles`:                        
                        optionSuccess = await viewRoles();
                        break;
                    case `View Employees`:                        
                        optionSuccess = await viewEmployees();
                        break;
                    case 'Exit':
                        optionSuccess = false;
                        break;
                };

                let continuePrompt = await inquirer.prompt(prompts.fetchContinueQuestions());

                if (response.mainMenuSelection === `Exit` || !continuePrompt.continue) {  
                    console.log(`Exiting application.`);
                    process.exit(0);
                }
            })
            .catch((err) => {
                if (err.isTtyError) {
                    console.log(`Prompt couldn't be rendered in the current environment`);
                } else {
                    console.log(`Something else went wrong: ${err}`);
                }
            });            
    } while (optionSuccess);

    process.exit(0);
}

main();
