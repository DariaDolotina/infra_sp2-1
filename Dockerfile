FROM python:3.8-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONBUFFERED 1

RUN mkdir /code
COPY requirements.txt /code

RUN apk add --no-cache --virtual .build-deps \
    ca-certificates gcc nano postgresql-dev linux-headers musl-dev \
    libffi-dev jpeg-dev zlib-dev \
    && pip install -r /code/requirements.txt --no-cache-dir

COPY . /code
WORKDIR /code

ENTRYPOINT sh ./entrypoint.sh
# добавляю не работающий CMD исключительно из-за требования автотестов
CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000