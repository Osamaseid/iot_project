from motor.motor_asyncio import AsyncIOMotorClient

MONGO_URI = "mongodb://localhost:27017"  # or use a cloud URI like MongoDB Atlas
client = AsyncIOMotorClient(MONGO_URI)
db = client.iot
user_collection = db.get_collection("users")
temperature_collection = db.get_collection("temperatures")
humidity_collection = db.get_collection("humidity")
