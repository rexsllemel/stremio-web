# Stremio Node 14.x
# the node version for running Stremio Web
ARG NODE_VERSION=20-alpine
FROM node:$NODE_VERSION AS base

# Meta
LABEL Description="Faith Stremio" Vendor="Faith Cloud" Version="1.0.0"

RUN mkdir -p /var/www/stremio-web
WORKDIR /var/www/stremio-web

# Install app dependencies
FROM base AS prebuild

RUN apk update && apk upgrade && \
    apk add --no-cache git
WORKDIR /var/www/stremio-web
RUN npm install

EXPOSE 8081
# RUN APP
WORKDIR /var/www/stremio-web

CMD ["npm", "start"]
