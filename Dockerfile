# syntax=docker/dockerfile:1
FROM node:alpine3.22 AS build

WORKDIR /app

# copy dep info and install deps
COPY package*.json ./

RUN npm install

# copy all source code
COPY . .

RUN npm run build


# deploy
FROM httpd:alpine3.22
WORKDIR /usr/local/apache2/htdocs/

COPY --from=build /app/dist .

EXPOSE 80

