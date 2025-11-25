#!/bin/bash
source /home/sdosala/flask-app/venv/bin/activate
exec gunicorn --workers 3 --bind unix:/home/sdosala/flask-app/gunicorn.sock app:app
