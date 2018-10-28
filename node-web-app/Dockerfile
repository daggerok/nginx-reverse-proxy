FROM node:alpine
LABEL MAINTAINER='Maksim Kostromin https://github.com/daggerok'
EXPOSE 3000
CMD npm start
WORKDIR /tmp
ADD . .
RUN npm i
