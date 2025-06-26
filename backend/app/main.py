from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session
from sqlalchemy import text
from .database import Base, engine, SessionLocal
from app.api import user_routes

app = FastAPI()
app.include_router(user_routes.router)

Base.metadata.create_all(bind=engine)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/")
def read_root():
    return {"message": "FastAPI y Postgres funcionando con Docker Compose"}

@app.get("/test-db")
def test_db_connection(db: Session = Depends(get_db)):
    try:
        db.execute(text("SELECT 1"))
        return {"db_connection": "ok"}
    except Exception as e:
        return {"db_connection": "error", "detail": str(e)}
    