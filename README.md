# Workflowexeua

## Project Description

**Workflowexeua** is a project aimed at automating CI processes using GitHub Actions and Docker. The project includes automated testing with Playwright, dependency checks with npm audit, and adherence to the Conventional Commits standard for maintaining a clear commit history and automating release processes.

## Key Features

- **Automated Testing**: Playwright is used for end-to-end testing of web applications.
- **Linting and Code Formatting**: Integrated ESLint and Prettier to maintain code standards.
- **Conventional Commits**: Use the Conventional Commits standard to manage commit messages.
- **Dependency Vulnerability Checks**: Utilize npm audit to check for vulnerabilities in dependencies.
- **Docker Buildx Bake**: Optimized Docker container builds using Docker Buildx Bake.

## Technologies Used

- **Docker**: Containerization and workflow management.
- **GitHub Actions**: CI/CD automation.
- **Playwright**: Framework for automated testing.
- **npm**: Package management and script execution.
- **ESLint**: Linting for JavaScript/TypeScript code.
- **Prettier**: Code formatting tool.
- **Commitlint**: Linting for commit messages to follow Conventional Commits.
- **Standard-version**: Automates versioning and changelog generation.
- **npm-audit-report**: Generates HTML reports from npm audit results.


## Installation and Usage

### Local Setup

1.  Clone the repository:
    
    `git clone https://github.com/smalovitsa/workflowexeua.git
    cd workflowexeua` 
    
2.  Install dependencies:
    
    `npm ci` 
    
3.  Run tests:
   
    `npm run test` 
    
4.  Run linting:

    `npm run lint` 
    
5.  Run code formatting:

    `npm run format` 
    
6.  Check for dependency vulnerabilities:

    `npm run audit:check` 
    

### Using Docker

To use Docker for this project, ensure you have Docker and Docker Compose installed.

1.  **Build Docker Containers**:
    
    To build the project using Docker Buildx Bake:

    `docker buildx bake --file docker-bake.hcl` 
    
2.  **Run Playwright Tests in Docker**:

    `docker buildx bake --file docker-bake.hcl test` 
    
3.  **Retrieve Test Artifacts**:
    
    After running Playwright tests, the report will be available as an HTML file. You can download the artifact from GitHub Actions or find it locally in the `./html-report` directory.
    
4.  **Check Dependencies for Vulnerabilities in Docker**:
    
    `docker buildx bake --file docker-bake.hcl audit-check` 
    

### CI with GitHub Actions

The project integrates with GitHub Actions to provide automated checks on every push or pull request.

Main CI steps:

-   **Tests**: Runs end-to-end tests using Playwright.
-   **Linting**: Ensures code follows ESLint rules.
-   **Formatting**: Checks and enforces code formatting using Prettier.
-   **Dependency Audit**: Runs `npm audit` to check for vulnerabilities, and the results are saved as an HTML report.
