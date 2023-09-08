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
let mainMenuOptions = ['View Departments', 'View Roles', 'View Employees', 'Exit'];

function fetchContinueQuestions() {
    let question = clientQuestion;
    // Initialize clientQuestions array
    clientQuestions = [];

    question.question = 'Continue?';
    question.varName = `continue`;
    question.type = 'confirm';
    question.choices = [];
    clientQuestions.push(JSON.parse(JSON.stringify(question)));

    buildPrompts();
    
    return prompts;

}

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
        if (prompt.type === 'list' || prompt.type === 'checkbox') {
            prompt.pageSize = 4;
        }
 
        prompts.push(JSON.parse(JSON.stringify(prompt))); 
    }        
    // console.log(prompts);
}


module.exports = {fetchMainMenuQuestions, fetchAddDepartmentQuestions, fetchContinueQuestions};

