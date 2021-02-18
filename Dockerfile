FROM python:3.8-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONBUFFERED 1

WORKDIR /code
COPY requirements.txt /code
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev && pip install -r /code/requirements.txt --no-cache-dir

COPY . /code

CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000
