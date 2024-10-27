FROM node:20.10-alpine AS build
WORKDIR /app

COPY ./package*.json .
RUN npm install -g @nestjs/cli
RUN npm install

COPY . .
RUN npm run build

FROM node:20.10-alpine AS production
WORKDIR /app

COPY package*.json .
COPY .env .
RUN npm install -g @nestjs/cli
RUN npm install

COPY --from=build /app/dist ./dist