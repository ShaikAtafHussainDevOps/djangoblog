FROM python:3.9

WORKDIR /app/backend

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD python /app/backend/manage.py runserver 0.0.0.0:8000