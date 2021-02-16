#!/bin/sh

python manage.py migrate --no-input
python manage.py collectstatic --no-input

gunicorn api_yamdb.wsgi -b 0.0.0.0:8000