from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from backend.routes import humidity, user, temperature, auth, real_time_stats, device_control

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(auth.router)
app.include_router(humidity.router)
app.include_router(user.router)
app.include_router(temperature.router)
app.include_router(real_time_stats.router)
app.include_router(device_control.router)
