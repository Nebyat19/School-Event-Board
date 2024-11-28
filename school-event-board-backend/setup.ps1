# Define the root directory
$rootDir = "school-event-board-backend"

# Create the root directory
New-Item -Path $rootDir -ItemType Directory -Force

# Create the services and shared directories
$servicesDir = "$rootDir\services"
$sharedDir = "$rootDir\shared"
New-Item -Path $servicesDir -ItemType Directory -Force
New-Item -Path $sharedDir -ItemType Directory -Force

# Create the main files in the root directory
Set-Content -Path "$rootDir\docker-compose.yml" -Value ""
Set-Content -Path "$rootDir\.gitignore" -Value ""
Set-Content -Path "$rootDir\LICENSE" -Value "MIT License"

# Create the root README.md file with detailed content
$rootReadmeContent = @"
# School Event Board Backend

The **School Event Board Backend** is a microservices-based system designed to efficiently manage and coordinate school events. It consists of three primary services:

- **Event Service**: Manages event creation, updates, deletions, and retrievals.
- **User Service**: Handles user authentication, registration, and profile management.
- **Notification Service**: Sends notifications to users about event updates and announcements.

## Architecture

This project follows a microservices architecture, allowing each service to be developed, deployed, and scaled independently. Services communicate via RESTful APIs and share common utilities and schemas located in the \`shared\` directory.

## Getting Started

### Prerequisites

- **Docker** and **Docker Compose** installed on your machine.
- **Python 3.8** or higher.

### Running the Services

To run all services together using Docker Compose:

\`\`\`bash
docker-compose up --build
\`\`\`

### Project Structure

- **services/**: Contains the microservices.
  - **event-service/**
  - **user-service/**
  - **notification-service/**
- **shared/**: Contains shared utilities and schemas.
- **docker-compose.yml**: Docker Compose configuration file.
- **LICENSE**: Project license information.

## Collaboration Guidelines

We welcome contributions from the community! To ensure smooth collaboration, please follow these guidelines:

- **Branch Naming**: Use descriptive branch names, e.g., \`feature/add-login-endpoint\` or \`bugfix/fix-event-model\`.
- **Pull Requests**: Ensure your PRs are focused on a single feature or fix. Include clear descriptions and reference any relevant issues.
- **Code Reviews**: Be open to feedback and aim for constructive discussions during code reviews.
- **Avoiding Merge Conflicts**:
  - Pull the latest changes from \`main\` before starting your work.
  - Resolve any merge conflicts locally before pushing.
  - Communicate with the team about significant changes that might affect others.

For more details, please see the **CONTRIBUTING.md** file.

---

© $(Get-Date -Format "yyyy") School Event Board Project. All rights reserved.
"@

Set-Content -Path "$rootDir\README.md" -Value $rootReadmeContent

# Create the CONTRIBUTING.md file
$contributingContent = @"
# Contributing to School Event Board Backend

We appreciate your interest in contributing to the project! Please follow these guidelines to contribute effectively.

## How to Contribute

1. **Fork the Repository**: Create your own fork of the repository.

2. **Clone the Fork**: Clone your fork to your local machine.

   \`\`\`bash
   git clone https://github.com/your-username/school-event-board-backend.git
   \`\`\`

3. **Create a Branch**: Create a new branch for your feature or bugfix.

   \`\`\`bash
   git checkout -b feature/your-feature-name
   \`\`\`

4. **Make Changes**: Implement your feature or fix.

5. **Commit Changes**: Commit your changes with clear and descriptive messages.

   \`\`\`bash
   git commit -m "Add feature X that does Y"
   \`\`\`

6. **Push Changes**: Push your changes to your fork.

   \`\`\`bash
   git push origin feature/your-feature-name
   \`\`\`

7. **Create a Pull Request**: Open a pull request to the \`main\` branch of the original repository.

## Code Style Guidelines

- Follow [PEP 8](https://www.python.org/dev/peps/pep-0008/) for Python code.
- Write descriptive docstrings for modules, classes, and functions.
- Include type hints where appropriate.

## Reporting Issues

- Use GitHub Issues to report bugs or request new features.
- Provide as much detail as possible, including steps to reproduce the issue.

## Testing

- Write unit tests for new features or bug fixes.
- Ensure all tests pass before submitting a pull request.

---

Thank you for contributing!

"@

Set-Content -Path "$rootDir\CONTRIBUTING.md" -Value $contributingContent

# Define the services
$services = @(
    @{
        Name = "event-service"
        Description = "The **Event Service** is responsible for managing events, including creation, updates, deletion, and retrieval."
        Port = 8001
    },
    @{
        Name = "user-service"
        Description = "The **User Service** handles user authentication, registration, and profile management."
        Port = 8002
    },
    @{
        Name = "notification-service"
        Description = "The **Notification Service** sends notifications to users about event updates and announcements."
        Port = 8003
    }
)

# Create each service
foreach ($service in $services) {
    $serviceName = $service.Name
    $serviceDir = "$servicesDir\$serviceName"
    New-Item -Path $serviceDir -ItemType Directory -Force

    # Create src directory
    $srcDir = "$serviceDir\src"
    New-Item -Path $srcDir -ItemType Directory -Force

    # Create app directory
    $appDir = "$srcDir\app"
    New-Item -Path $appDir -ItemType Directory -Force

    # Create __init__.py in app directory
    Set-Content -Path "$appDir\__init__.py" -Value ""

    # Create main.py with basic function
    $mainPyContent = @"
from fastapi import FastAPI
from .routes import router

app = FastAPI(title='$(($serviceName -replace '-', ' ').ToUpper())')

app.include_router(router)
"@

    Set-Content -Path "$appDir\main.py" -Value $mainPyContent

    # Create models.py with basic class
    $modelsPyContent = @"
from pydantic import BaseModel

class ExampleModel(BaseModel):
    id: int
    name: str
"@

    Set-Content -Path "$appDir\models.py" -Value $modelsPyContent

    # Create routes.py with basic route
    $routesPyContent = @"
from fastapi import APIRouter
from .models import ExampleModel

router = APIRouter()

@router.get('/', summary='Health Check')
def read_root():
    return {'message': 'Welcome to the $(($serviceName -replace '-', ' ').ToUpper())'}

@router.get('/examples', response_model=ExampleModel, summary='Get Example')
def get_example():
    return ExampleModel(id=1, name='Example')
"@

    Set-Content -Path "$appDir\routes.py" -Value $routesPyContent

    # Create services directory
    $servicesDirApp = "$appDir\services"
    New-Item -Path $servicesDirApp -ItemType Directory -Force
    Set-Content -Path "$servicesDirApp\__init__.py" -Value ""

    # Create a service file with basic function
    $serviceFileName = "$($serviceName -replace '-service', '')_service.py"
    $serviceFilePath = "$servicesDirApp\$serviceFileName"
    $servicePyContent = @"
def get_data():
    return 'Data from $serviceName.'
"@
    Set-Content -Path $serviceFilePath -Value $servicePyContent

    # Create config directory
    $configDir = "$srcDir\config"
    New-Item -Path $configDir -ItemType Directory -Force
    Set-Content -Path "$configDir\__init__.py" -Value ""

    # Create settings.py with basic config
    $settingsPyContent = @"
import os

DATABASE_URL = os.getenv('DATABASE_URL', 'sqlite:///./$($serviceName).db')
"@
    Set-Content -Path "$configDir\settings.py" -Value $settingsPyContent

    # Create tests directory
    $testsDir = "$srcDir\tests"
    New-Item -Path $testsDir -ItemType Directory -Force
    Set-Content -Path "$testsDir\__init__.py" -Value ""

    # Create a test file with basic test
    $testFileName = "test_$($serviceName -replace '-service', '').py"
    $testFilePath = "$testsDir\$testFileName"
    $testPyContent = @"
def test_example():
    assert True
"@
    Set-Content -Path $testFilePath -Value $testPyContent

    # Create Dockerfile
    $dockerfileContent = @"
# Dockerfile for $serviceName
FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "src.app.main:app", "--host", "0.0.0.0", "--port", "8000"]
"@
    Set-Content -Path "$serviceDir\Dockerfile" -Value $dockerfileContent

    # Create requirements.txt
    $requirementsContent = @"
fastapi
uvicorn
pydantic
"@
    Set-Content -Path "$serviceDir\requirements.txt" -Value $requirementsContent

    # Format service name for README
    $formattedServiceName = ($serviceName -split '-') | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) } -join ' '

    # Create README.md for the service
    $serviceReadmeContent = @"
# $formattedServiceName

$($service.Description)

## Setup Instructions

### Running Locally

1. **Navigate to the service directory**:

   \`\`\`bash
   cd services/$serviceName
   \`\`\`

2. **Create a virtual environment** (optional but recommended):

   \`\`\`bash
   python -m venv venv
   source venv/bin/activate  # On Windows use: venv\Scripts\activate
   \`\`\`

3. **Install dependencies**:

   \`\`\`bash
   pip install -r requirements.txt
   \`\`\`

4. **Run the service**:

   \`\`\`bash
   uvicorn src.app.main:app --reload --port $($service.Port)
   \`\`\`

### Running with Docker

1. **Build the Docker image**:

   \`\`\`bash
   docker build -t $($serviceName):latest .
   \`\`\`

2. **Run the Docker container**:

   \`\`\`bash
   docker run -p $($service.Port):8000 $($serviceName):latest
   \`\`\`

## API Endpoints

- \`GET /\` - Health check endpoint.
- \`GET /examples\` - Retrieves example data.

---

"@
    Set-Content -Path "$serviceDir\README.md" -Value $serviceReadmeContent
}

# Create shared directory contents

# Create utils directory
$sharedUtilsDir = "$sharedDir\utils"
New-Item -Path $sharedUtilsDir -ItemType Directory -Force
Set-Content -Path "$sharedUtilsDir\__init__.py" -Value ""

# Create db.py
$dbPyContent = @"
def get_db():
    '''Database connection utility function.'''
    pass  # Implement database connection logic here
"@
Set-Content -Path "$sharedUtilsDir\db.py" -Value $dbPyContent

# Create jwt.py
$jwtPyContent = @"
def create_token(data):
    '''JWT token generation utility function.'''
    pass  # Implement JWT token generation logic here
"@
Set-Content -Path "$sharedUtilsDir\jwt.py" -Value $jwtPyContent

# Create logger.py
$loggerPyContent = @"
import logging

def get_logger(name):
    '''Centralized logger setup.'''
    logger = logging.getLogger(name)
    # Configure logging here
    return logger
"@
Set-Content -Path "$sharedUtilsDir\logger.py" -Value $loggerPyContent

# Create schemas directory
$sharedSchemasDir = "$sharedDir\schemas"
New-Item -Path $sharedSchemasDir -ItemType Directory -Force
Set-Content -Path "$sharedSchemasDir\__init__.py" -Value ""

# Create event_schemas.py
$eventSchemasPyContent = @"
from pydantic import BaseModel

class EventSchema(BaseModel):
    id: int
    name: str
    description: str
    date: str
"@
Set-Content -Path "$sharedSchemasDir\event_schemas.py" -Value $eventSchemasPyContent

# Create user_schemas.py
$userSchemasPyContent = @"
from pydantic import BaseModel

class UserSchema(BaseModel):
    id: int
    username: str
    email: str
"@
Set-Content -Path "$sharedSchemasDir\user_schemas.py" -Value $userSchemasPyContent

# Create notification_schemas.py
$notificationSchemasPyContent = @"
from pydantic import BaseModel

class NotificationSchema(BaseModel):
    id: int
    message: str
    recipient_id: int
"@
Set-Content -Path "$sharedSchemasDir\notification_schemas.py" -Value $notificationSchemasPyContent

# Create config directory
$sharedConfigDir = "$sharedDir\config"
New-Item -Path $sharedConfigDir -ItemType Directory -Force
Set-Content -Path "$sharedConfigDir\__init__.py" -Value ""

# Create settings.py in shared config
$sharedSettingsPyContent = @"
import os

SECRET_KEY = os.getenv('SECRET_KEY', 'your-secret-key')
ALGORITHM = 'HS256'
ACCESS_TOKEN_EXPIRE_MINUTES = 30
"@
Set-Content -Path "$sharedConfigDir\settings.py" -Value $sharedSettingsPyContent

# Create docker-compose.yml with basic content
$dockerComposeContent = @"
version: '3.9'
services:
  event-service:
    build: ./services/event-service
    ports:
      - '8001:8000'
    environment:
      - DATABASE_URL=\${DATABASE_URL}
    depends_on:
      - db
  user-service:
    build: ./services/user-service
    ports:
      - '8002:8000'
    environment:
      - DATABASE_URL=\${DATABASE_URL}
    depends_on:
      - db
  notification-service:
    build: ./services/notification-service
    ports:
      - '8003:8000'
    environment:
      - DATABASE_URL=\${DATABASE_URL}
    depends_on:
      - db
  db:
    image: postgres:13
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
    ports:
      - '5432:5432'
    volumes:
      - db_data:/var/lib/postgresql/data

volumes:
  db_data:
"@
Set-Content -Path "$rootDir\docker-compose.yml" -Value $dockerComposeContent

# Create .gitignore with basic content
$gitignoreContent = @"
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# C extensions
*.so

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg

# Virtual environment
venv/
.env
env/
ENV/

# Pytest cache
.cache

# MyPy cache
.mypy_cache/

# Pyre type checker
.pyre/

# VSCode
.vscode/

# MacOS
.DS_Store

# Docker
*.env
docker-compose.override.yml

# Logs
*.log

# IDEs
.idea/
"@
Set-Content -Path "$rootDir\.gitignore" -Value $gitignoreContent

Write-Host "Project setup completed successfully in '$rootDir'."
