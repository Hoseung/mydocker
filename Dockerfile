# syntax=docker/dockerfile:1 
FROM ubuntu:22.04
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apt update && apt install -y \
    build-essential \
    python3-pip
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt 
EXPOSE 5000 
COPY . .
CMD ["flask", "run"]