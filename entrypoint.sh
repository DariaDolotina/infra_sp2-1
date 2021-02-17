#!/bin/sh

apk add --no-cache --virtual .build-deps \
    ca-certificates gcc nano postgresql-dev linux-headers musl-dev \
    libffi-dev jpeg-dev zlib-dev \

python manage.py makemigrations
python manage.py migrate --noinput
python manage.py collectstatic --noinput