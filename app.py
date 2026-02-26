from fastapi import FastAPI
import asyncio
import time

app = FastAPI()

@app.get("/hit1")
async def hit_response():
    print("Starting.")
    time.sleep(5)
    print("finished")
    return {"message": "Hit response triggered"}

@app.get("/hit2")
def hit_response2():
    print("Starting.")
    time.sleep(5)
    print("finished")
    return {"message": "Hit response sync triggered"}
