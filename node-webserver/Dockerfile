FROM node:16-alpine

RUN echo "Asia/shanghai" > /etc/timezone

RUN mkdir /app
WORKDIR /app
ADD package.json /app
ADD app.js /app
RUN npm i

ENV PORT=4000
ENV API_SERVER=http://127.0.0.1:80
EXPOSE 4000

CMD node app.js $PORT $API_SERVER