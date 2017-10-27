FROM ubuntu:17.10
MAINTAINER Maksim Kostromin https://github.com/daggerok

CMD service nginx restart; npm start

RUN apt update \
 && apt install -y nginx nodejs npm unattended-upgrades

ADD docker/nginx /etc/nginx/sites-available/default
ADD docker/unattended-upgrades /etc/apt/apt.conf.d/20auto-upgrades

WORKDIR /opt/app
COPY package.json package.json
COPY app app
RUN npm i --no-optional --production
