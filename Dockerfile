FROM ubuntu:17.10
MAINTAINER Maksim Kostromin https://github.com/daggerok

CMD service nginx restart; npm start

RUN apt update \
 && apt install -y \
    nginx \
    nodejs npm \
    unattended-upgrades \
    fail2ban # && cp -Rf /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# RUN cp -Rf /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

ADD docker/default /etc/nginx/sites-available/default

ADD docker/20auto-upgrades       /etc/apt/apt.conf.d/20auto-upgrades
ADD docker/50unattended-upgrades /etc/apt/apt.conf.d/50unattended-upgrades

WORKDIR /opt/app
COPY package.json package.json
COPY app app
RUN npm i --no-optional --production
