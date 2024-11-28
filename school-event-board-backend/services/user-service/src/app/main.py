from fastapi import FastAPI
from .routes import router

app = FastAPI(title='USER SERVICE')

app.include_router(router)
