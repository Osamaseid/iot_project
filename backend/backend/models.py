from datetime import datetime
from typing import Optional, List

from pydantic import ConfigDict, BaseModel, Field, EmailStr
from pydantic.functional_validators import BeforeValidator

from typing_extensions import Annotated


PyObjectId = Annotated[str, BeforeValidator(str)]


class UserModel(BaseModel):
    """
    Container for a single user record.
    """
    
    id: Optional[PyObjectId] = Field(alias="_id", default=None)
    name: str = Field(...)
    email: EmailStr = Field(...)
    password: str = Field(...)
    # created_at: datetime = Field(
    #     default_factory=datetime.utcnow())

    model_config = ConfigDict(
        populate_by_name=True,
        arbitrary_types_allowed=True,
        json_schema_extra={
            "example": {
                "name": "Jane Doe",
                "email": "jdoe@example.com",
                "password": "sdf894s6f2se984fsef",
                # "created_at": "2023-09-20T12:34:56.789Z"
            }
        },
    )
    
    
class UserCollection(BaseModel):
    users: List[UserModel]


class TemperatureModel(BaseModel):
    id: Optional[PyObjectId] = Field(alias="_id", default=None)
    value: float = Field(...)
    date_time: datetime = Field(
        default_factory=datetime.now())

    model_config = ConfigDict(
        populate_by_name=True,
        arbitrary_types_allowed=True,
        json_schema_extra={
            "example": {
                "value": 30,
                "date_time": "2023-09-20T12:34:56.789Z"
            }
        },
    )
    
    
class TemperatureCollection(BaseModel):
    temperatures: List[TemperatureModel]
    

class HumidityModel(BaseModel):
    id: Optional[PyObjectId] = Field(alias="_id", default=None)
    value: float = Field(...)
    date_time: datetime = Field(
        default_factory=datetime.now())

    model_config = ConfigDict(
        populate_by_name=True,
        arbitrary_types_allowed=True,
        json_schema_extra={
            "example": {
                "value": 30,
                "date_time": "2023-09-20T12:34:56.789Z"
            }
        },
    )
    
    
class HumidityCollections(BaseModel):
    humidity: List[HumidityModel]
    
     
class Token(BaseModel):
    access_token: str
    token_type: str


class TokenData(BaseModel):
    username: str | None = None
