FROM node:12-alpine

WORKDIR /movie-analyst-ui

COPY . . 

RUN yarn install --production
RUN apk --no-cache add curl

CMD [ "node", "/movie-analyst-ui/server.js" ]