from pydantic import BaseModel

class EventSchema(BaseModel):
    id: int
    name: str
    description: str
    date: str
