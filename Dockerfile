FROM python:3.8-slim

COPY amazoncrawler /app/amazoncrawler
COPY background_app /app/background_app
COPY django_amazon /app/django_amazon
COPY media /app/media
COPY tracker /app/tracker
COPY users /app/users
COPY db.sqlite3 /app
COPY requirements.txt /app
COPY manage.py /app


WORKDIR /app

RUN apt-get update && \
    apt-get -y upgrade && \
    pip install --upgrade pip && \
    pip install -r requirements.txt && \
    python manage.py makemigrations && \
    python manage.py migrate

ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8000"]