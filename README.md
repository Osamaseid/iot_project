# IoT Malaria Prevention System

An IoT-based environmental monitoring and mosquito control system for malaria prevention in Africa. The system tracks temperature and humidity in real-time, provides educational content about malaria, and controls hardware devices (fans, UV lights, sound emitters) to reduce mosquito breeding and biting.

## Architecture

```
iot_project/
├── backend/          # FastAPI REST API + WebSocket
│   ├── backend/
│   │   ├── routes/
│   │   │   ├── auth.py            # JWT authentication
│   │   │   ├── temperature.py     # Temperature CRUD
│   │   │   ├── humidity.py        # Humidity CRUD
│   │   │   ├── real_time_stats.py # WebSocket real-time stats
│   │   │   ├── device_control.py  # Fan/UV/Sound control
│   │   │   └── user.py            # User registration
│   │   ├── database.py            # MongoDB (Motor) connection
│   │   ├── models.py              # Pydantic models
│   │   ├── utils.py               # Password hashing, JWT config
│   │   └── main.py                # FastAPI app entry point
│   └── pyproject.toml
└── frontend/         # Flutter mobile app
    ├── lib/
    │   ├── api/iot_service.dart   # HTTP + WebSocket client
    │   ├── screens/               # UI screens
    │   └── widgets/               # Reusable widgets
    └── assets/data/               # Malaria education content
        ├── english.md
        ├── amharic.md
        └── oromoifa.md
```

## Backend

- **Framework**: FastAPI with async support
- **Database**: MongoDB via Motor (async driver)
- **Auth**: JWT tokens with bcrypt password hashing
- **Real-time**: WebSocket endpoint at `/ws/stats` for live temperature/humidity updates
- **Endpoints**:
  - `POST /token/` — Login
  - `POST /users/` — Register
  - `POST /temperature/` — Record temperature
  - `GET /temperature/` — Get recent temperatures
  - `POST /humidity/` — Record humidity
  - `GET /humidity/` — Get recent humidity readings
  - `POST /device_control/fan` — Toggle fan
  - `POST /device_control/uv` — Toggle UV light
  - `POST /device_control/sound` — Toggle sound emitter

### Run backend

```bash
cd backend
poetry install
poetry run uvicorn backend.main:app --reload
```

## Frontend

- **Framework**: Flutter (Dart)
- **Features**:
  - Real-time sensor dashboard (WebSocket)
  - Device control (fan, UV, sound)
  - Malaria education in English, Amharic, and Oromo
  - Push notifications & alerts
- **Dependencies**: `fl_chart`, `web_socket_channel`, `http`, `lottie`, `google_fonts`, `shared_preferences`, `flutter_local_notifications`

### Run frontend

```bash
cd frontend
flutter pub get
flutter run
```

## Hardware Integration

The system is designed to interface with an MCU-001 microcontroller collecting temperature and humidity sensor data, and controlling actuators (fan, UV light, buzzer) for mosquito population management.
