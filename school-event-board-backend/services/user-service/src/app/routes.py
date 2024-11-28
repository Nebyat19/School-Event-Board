from fastapi import APIRouter
from .models import ExampleModel

router = APIRouter()

@router.get('/', summary='Health Check')
def read_root():
    return {'message': 'Welcome to the USER SERVICE'}

@router.get('/examples', response_model=ExampleModel, summary='Get Example')
def get_example():
    return ExampleModel(id=1, name='Example')
