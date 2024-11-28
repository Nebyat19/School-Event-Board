# 

The **Event Service** is responsible for managing events, including creation, updates, deletion, and retrieval.

## Setup Instructions

### Running Locally

1. **Navigate to the service directory**:

   ```
   cd services/event-service
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
   uvicorn src.app.main:app --reload --port 8001
   ```

### Running with Docker

1. **Build the Docker image**:

   ```
   docker build -t event-service:latest .
   ```

2. **Run the Docker container**:

   ```
   docker run -p 8001:8000 event-service:latest
   ```

## API Endpoints

- \GET /\ - Health check endpoint.
- \GET /examples\ - Retrieves example data.

---

