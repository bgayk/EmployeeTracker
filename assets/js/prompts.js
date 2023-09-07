// Individual clientQuestion object
let clientQuestion = {
    question: '',
    varName: '',
    type: '',
    choices: []
};
// Array of clientQuestion objects
let clientQuestions = [];

// Inquirer prompt object
let prompt = {
    type: '',
    message: '',
    name: '',
    choices: []
}
// Inquire prompt objectS
let prompts = [];

// Main Menu Options and Functions
let mainMenuOptions = ['Add Department', 'Add Role', 'Add Employee', 'View Departments', 'View Roles', 'View Employees', 'Update Employee Role', 'Exit'];


function fetchMainMenuQuestions() {
    let question = clientQuestion;
    // Initialize clientQuestions array
    clientQuestions = [];

    question.question = 'What would you like to do?';
    question.varName = `mainMenuSelection`;
    question.type = 'list';
    question.choices = mainMenuOptions;
    clientQuestions.push(JSON.parse(JSON.stringify(question)));

    buildPrompts();
    
    return prompts;
}

function fetchAddDepartmentQuestions() {
    let question = clientQuestion;
    // Initialize clientQuestions array
    clientQuestions = [];

    question.question = 'Please enter the new department name: ';
    question.varName = `deptName`;
    question.type = 'input';
    question.choices = '';
    clientQuestions.push(JSON.parse(JSON.stringify(question)));

    buildPrompts();
    
    return prompts;
}


function loadQuestions() {
    let question = clientQuestion;
    // Initialize clientQuestions array
    clientQuestions = [];

    
    question.question = 'Enter your logo text: ';
    question.varName = `logoText`;
    question.type = 'input';
    question.choices = [];
    clientQuestions.push(JSON.parse(JSON.stringify(question)));


    question.question = 'Enter your logo text color: ';
    question.varName = `logoTextColor`;
    question.type = 'input';
    question.choices = [];
    clientQuestions.push(JSON.parse(JSON.stringify(question)));

    question.question = 'Select your logo shape: ';
    question.varName = `logoShape`;
    question.type = 'list';
    question.choices = ['Square', 'Circle', 'Triangle'];
    clientQuestions.push(JSON.parse(JSON.stringify(question)));

    question.question = 'Enter your logo shape color: ';
    question.varName = `logoShapeColor`;
    question.type = 'input';
    question.choices = [];
    clientQuestions.push(JSON.parse(JSON.stringify(question)));

    // console.log(clientQuestions);
    buildPrompts();
}

function buildPrompts() {    
    // Initialize prompts array
    prompts = [];
    
    // Looping through questions and building prompt array for inquirer
    for(let i = 0; i < clientQuestions.length; i++) {
        clientQuestion = clientQuestions[i];

        prompt.type = clientQuestion.type;
        prompt.message = clientQuestion.question;
        prompt.name = clientQuestion.varName;
        prompt.choices = clientQuestion.choices;
 
        prompts.push(JSON.parse(JSON.stringify(prompt))); 
    }        
    // console.log(prompts);
}

function fetchPrompts() {
    loadQuestions();

    return prompts;
}


module.exports = {fetchMainMenuQuestions, fetchAddDepartmentQuestions};

