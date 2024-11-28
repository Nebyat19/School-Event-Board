from fastapi import FastAPI
from .routes import router

app = FastAPI(title='NOTIFICATION SERVICE')

app.include_router(router)
