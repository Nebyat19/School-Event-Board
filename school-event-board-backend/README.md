# School Event Board Backend

The **School Event Board Backend** is a microservices-based system designed to efficiently manage and coordinate school events. It consists of three primary services:

- **Event Service**: Manages event creation, updates, deletions, and retrievals.
- **User Service**: Handles user authentication, registration, and profile management.
- **Notification Service**: Sends notifications to users about event updates and announcements.

## Architecture

This project follows a microservices architecture, allowing each service to be developed, deployed, and scaled independently. Services communicate via RESTful APIs and share common utilities and schemas located in the \shared\ directory.

## Getting Started

### Prerequisites

- **Docker** and **Docker Compose** installed on your machine.
- **Python 3.8** or higher.

### Running the Services

To run all services together using Docker Compose:

```
docker-compose up --build
```
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

- **Branch Naming**: Use descriptive branch names, e.g., \feature/add-login-endpoint\ or \bugfix/fix-event-model\.
- **Pull Requests**: Ensure your PRs are focused on a single feature or fix. Include clear descriptions and reference any relevant issues.
- **Code Reviews**: Be open to feedback and aim for constructive discussions during code reviews.
- **Avoiding Merge Conflicts**:
  - Pull the latest changes from \main\ before starting your work.
  - Resolve any merge conflicts locally before pushing.
  - Communicate with the team about significant changes that might affect others.

For more details, please see the **CONTRIBUTING.md** file.

---

© 2024 School Event Board Project. All rights reserved.
