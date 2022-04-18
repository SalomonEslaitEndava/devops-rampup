FROM node:12-alpine

WORKDIR /movie-analyst-api

COPY . . 

RUN yarn install --production

CMD [ "node", "/movie-analyst-api/server.js" ]