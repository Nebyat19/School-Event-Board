from fastapi import FastAPI
from .routes import router

app = FastAPI(title='EVENT SERVICE')

app.include_router(router)
