FROM python:3.10.13-alpine

USER root
RUN apk update && apk upgrade --no-cache
RUN pip3 install --upgrade pip
WORKDIR /usr/src/app/producer
COPY ./producer .
COPY .env .
COPY requirements.txt .
RUN chmod +x /usr/src/app/producer/*
RUN pip3 install --no-cache-dir -r requirements.txt
#CMD ["python","producer.py"]
USER 1001
ENV PYTHONUNBUFFERED 1
CMD tail -f /dev/null