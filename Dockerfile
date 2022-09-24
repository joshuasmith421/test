FROM ubuntu:20.04

COPY . /app
ENV APP_HOME /app
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR $APP_HOME
ADD requirements.txt .
RUN apt update -y && apt upgrade -y && apt install python3-pip iputils-ping curl wget fonts-liberation \
    libappindicator3-1 libasound2 libatk-bridge2.0-0 libnspr4 libnss3 lsb-release xdg-utils libxss1 libdbus-glib-1-2 \
    libgbm1 xvfb -y

RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.31.0/geckodriver-v0.31.0-linux64.tar.gz && \
    tar -zxf geckodriver-v0.31.0-linux64.tar.gz -C /usr/local/bin && chmod +x /usr/local/bin/geckodriver && \
    rm geckodriver-v0.31.0-linux64.tar.gz && \
    wget -O firefox-setup.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64" && \
    tar xjf firefox-setup.tar.bz2 -C /opt/ && ln -s /opt/firefox/firefox /usr/bin/firefox && rm firefox-setup.tar.bz2

RUN pip3 install -r requirements.txt

CMD gunicorn --reload -b 0.0.0.0:5000 "app:create_app()"
