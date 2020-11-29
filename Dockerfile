FROM python:3
ENV PYTHONUNBUFFERED=1
WORKDIR /code/src/app
COPY requirements.txt /code/src/app
RUN pip install --no-cache-dir -r requirements.txt
COPY . /code/src/app
