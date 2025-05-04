from fastapi import APIRouter, status, Body, HTTPException
from backend.models import HumidityCollections, HumidityModel
from backend.database import humidity_collection

router = APIRouter(prefix="/humidity", tags=["Humidity"])


@router.post("/", response_description="Add PH",
          response_model=HumidityModel,
          status_code=status.HTTP_201_CREATED,
          response_model_by_alias=False,)
async def add_humidity(humidity: HumidityModel = Body(...)):
    new_humidity = await humidity_collection.insert_one(
        humidity.model_dump(by_alias=True, exclude=["id"])
    )
    created_humidity = await humidity_collection.find_one(
        {"_id": new_humidity.inserted_id}
    )
    return created_humidity


@router.get("/")
async def get_humidities():
    try:
        return HumidityCollections(
            humidities=await humidity_collection.find().to_list(10)
        )
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
