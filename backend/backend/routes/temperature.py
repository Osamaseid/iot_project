from fastapi import APIRouter, status, Body, HTTPException
from backend.models import TemperatureModel, TemperatureCollection
from backend.database import temperature_collection

router = APIRouter(prefix="/temperature", tags=["Temperature"])

@router.post("/", response_description="Add temperatures",
              response_model=TemperatureModel,
              status_code=status.HTTP_201_CREATED,
              response_model_by_alias=False)
async def add_temperature(temperature: TemperatureModel = Body(...)):
    # Insert the temperature data directly without user association
    new_temp = await temperature_collection.insert_one(
        temperature.model_dump(by_alias=True, exclude=["id"])
    )
    created_temp = await temperature_collection.find_one(
        {"_id": new_temp.inserted_id}
    )
    return created_temp

@router.get("/")
async def get_temperature():
    try:
        return TemperatureCollection(
            temperatures=await temperature_collection.find().to_list(10)
        )
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))