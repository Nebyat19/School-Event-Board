# 

The **Notification Service** sends notifications to users about event updates and announcements.

## Setup Instructions

### Running Locally

1. **Navigate to the service directory**:

   ```
   cd services/notification-service
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
   uvicorn src.app.main:app --reload --port 8003
   ```

### Running with Docker

1. **Build the Docker image**:

   ```
   docker build -t notification-service:latest .
   ```

2. **Run the Docker container**:

   ```
   docker run -p 8003:8000 notification-service:latest
   ```

## API Endpoints

- \GET /\ - Health check endpoint.
- \GET /examples\ - Retrieves example data.

---

