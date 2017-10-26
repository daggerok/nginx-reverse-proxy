FROM ubuntu:17.10
MAINTAINER Maksim Kostromin https://github.com/daggerok

CMD service nginx restart; npm start

RUN apt update \
 && apt install -y nginx nodejs npm

WORKDIR /opt/app
COPY sites-available.default /etc/nginx/sites-available/default
COPY package.json package.json
COPY app app
RUN npm i --no-optional --production
