# import asyncio
from fastapi import APIRouter, WebSocketDisconnect, WebSocket
from backend.database import temperature_collection, humidity_collection

router = APIRouter(prefix="/ws", tags=["WS"])


@router.websocket("/stats")
async def websocket_endpoint(websocket: WebSocket):
    await websocket.accept()
    data = {"temp": 0, "humidity": 0}
    try:
        while True:
            temp = await temperature_collection.find_one(sort=[("_id", -1)])
            humidity = await humidity_collection.find_one(sort=[("_id", -1)])
            
            # aviod unnessary websocket send check if there is update and send if there is one.
            if (data["temp"] != temp["value"] or data["humidity"] != humidity["value"]):
                data = {
                    "temp": temp["value"],
                    "humidity": humidity["value"],
                }
                await websocket.send_json(data)
                # await asyncio.sleep(2)  # further aviod continues websocket send by 2 seconds.
            
    except WebSocketDisconnect:
        print("Client disconnected")
        