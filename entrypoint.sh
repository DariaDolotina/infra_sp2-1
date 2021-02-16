#!/bin/sh

python manage.py makemigrations
python manage.py migrate --noinput
python manage.py collectstatic --noinput

gunicorn api_yamdb.wsgi -b 0.0.0.0:8000
