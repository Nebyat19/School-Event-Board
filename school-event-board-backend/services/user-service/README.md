# 

The **User Service** handles user authentication, registration, and profile management.

## Setup Instructions

### Running Locally

1. **Navigate to the service directory**:

   ```
   cd services/user-service
   ```

2. **Create a virtual environment** (optional but recommended):

   ```
   python -m venv venv
   source venv/bin/activate  # On Windows use: venv\Scripts\activate
   ```

3. **Install dependencies**:

   ```
   pip install -r requirements.txt
   ```

4. **Run the service**:

   ```
   uvicorn src.app.main:app --reload --port 8002
   ```

### Running with Docker

1. **Build the Docker image**:

   ```
   docker build -t user-service:latest .
   ```

2. **Run the Docker container**:

   ```
   docker run -p 8002:8000 user-service:latest
   ```

## API Endpoints

- \GET /\ - Health check endpoint.
- \GET /examples\ - Retrieves example data.

---

