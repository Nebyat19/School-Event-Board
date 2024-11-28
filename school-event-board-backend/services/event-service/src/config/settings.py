import os

DATABASE_URL = os.getenv('DATABASE_URL', 'sqlite:///./event-service.db')
