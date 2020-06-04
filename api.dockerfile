# Stage 1 - build
FROM node:dubnium-alpine as build

# --no-cache: download package index on-the-fly, no need to cleanup afterwards
# --virtual: bundle packages, remove whole bundle at once, when done
RUN apk --no-cache --virtual build-dependencies add \
  jq

WORKDIR /app


COPY service/package.json /app

COPY service/package.json /app/package.json

RUN yarn install --pure-lockfile

COPY service/ /app

ENV NODE_ENV production
ENV PORT 80

CMD npm start
