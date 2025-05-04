from fastapi import APIRouter, Body

router = APIRouter(prefix="/device_control", tags=["Device Control"])


@router.post("/sound")
async def toggle_sound(switch: bool = Body(...)):
    # TODO: implement toggle sound function
    return {"message": "Sound toggled"}

@router.post("/uv")
async def toggle_uv_light(switch: bool = Body(...)):
    # TODO: implement toggle uv light function
    return {"message": "UV light toggled"}
@router.post("/fan")
async def toggle_fan(switch: bool = Body(...)):
    # TODO: implement toggle fan function
    return {"message": "Fan toggled"}

