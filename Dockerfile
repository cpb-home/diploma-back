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

COPY --from=build /app/dist .








# FROM node:20.10-alpine AS production
# WORKDIR /app

# COPY package*.json .
# # RUN npm i nodemon

# COPY --from=build /app/dist .

# CMD ["npm", "run", "start:prod"]













# FROM node:20.10-alpine

# WORKDIR /app

# #ARG NODE_ENV=production
# COPY ./package*.json ./
# RUN npm install
# COPY ./routes routes/
# COPY ./views views/
# COPY ./models models/
# COPY ./public public/
# COPY ./middleware middleware/
# COPY ./index.js ./

# CMD [ "npm", "run", "server" ]