from pydantic import BaseModel

class NotificationSchema(BaseModel):
    id: int
    message: str
    recipient_id: int
