FROM ubuntu:20.04

COPY . /app
ENV APP_HOME /app
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR $APP_HOME
ADD requirements.txt .
RUN apt update -y && apt upgrade -y && apt install python3-pip iputils-ping curl -y
RUN pip3 install -r requirements.txt

CMD gunicorn --reload -b 0.0.0.0:5000 "app:create_app()"
